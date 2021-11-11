from pycparser import c_ast, parse_file, c_generator, c_parser
from pycparser_fake_libc import directory
from copy import deepcopy


function_def_namespace = dict()
template_function = c_parser.CParser().parse( "int CLEVERTEST(){}").ext[0]


def load(file_name):
    cpp_args = r'-I{}'.format(directory)
    node_ast = parse_file(file_name, use_cpp=True,
            cpp_path='gcc',
            cpp_args=['-E', cpp_args])
    return node_ast

def find_def(node, target_name, prefix=False):
    result = function_def_namespace.get(target_name, None)
    if result is  None:
        v = FuncDefVisitor(target_name, prefix)
        v.visit(node)
        result = v.container
        function_def_namespace[target_name] = result
    return result

def find_all_def(node):
    adv = AllFuncDefVisitor()
    adv.visit(node)
    return adv.result

class AllFuncDefVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.result = dict()

    def visit_FuncDef(self, node):
        self.result[node.decl.name] = node
        for c in node:
            self.visit(c)

class FuncDefVisitor(c_ast.NodeVisitor):
    def __init__(self, target, prefix=False):
        self.target = target
        self.container = None
        self.prefix = prefix
        self.name_to_node = dict()

    def visit_FuncDef(self, node):
        function_def_namespace[node.decl.name] = node
        if (self.container is None and node.decl.name == self.target):
            self.container = node
            return
        elif (self.prefix and ( node.decl.name == self.target + "_old" or node.decl.name == self.target + "_new") ):
            self.container = node
            return

def find_callees(node):
    fcv = FuncCall_visitor(node)
    fcv.visit(node)
    return fcv.result



def function_rename(function_node, name):
    if isinstance(function_node, c_ast.FuncDef):
        renamed_type = function_node.decl.type
        while not isinstance(renamed_type, c_ast.TypeDecl):
            renamed_type = renamed_type.type
        renamed_type.declname = name

class FuncCall_visitor(c_ast.NodeVisitor):

    def __init__(self, exception):
        self.result = []
        self.exception = exception

    def visit_FuncDef(self, node):
        if node != self.exception:
            #do nothing if a child def is found
            return
        else:
            for c in node:
                self.visit(c)

    def visit_FuncCall(self, node):
        self.result.append(node.name.name)
        for c in node:
            self.visit(c)



class Verison_Renamer(c_ast.NodeVisitor):

    def __init__(self, filter, suffix = ""):
        self.filter = filter
        self.suffix = suffix

    def visit_FuncDef(self, node):
        if node.decl.name in self.filter:
            new_name = node.decl.name + self.suffix
            function_rename(node, new_name)
        for c in node:
            self.visit(c)

    def visit_FuncCall(self, node):
        if node.name.name in self.filter:
            node.name.name += self.suffix
        for c in node:
            self.visit(c)

def get_item(lst, index, min, max, lower=True):
    if index < 0:
        return  min
    elif index >= len(lst):
        return max
    else:
        if lower:
            return lst[index]+1
        else:
            return lst[index]-1

def find_cover(lst, t, max):
    res = []
    lower = 0
    upper = max
    lower_index = 0
    upper_index = len(lst)
    #step one, find the index in lst that contains t
    for i in range(len(lst)):
        index = lst[i]
        if index == t:
            lower_index = i
            upper_index = i
            lower = t
            upper = t
            res.append((t, t+1))
            break
        elif index > t:
            lower_index = i-1
            upper_index = i
            lower = get_item(lst, lower_index, 0, max, True)
            upper = get_item(lst, upper_index, 0, max, False)
            res.append((lower, upper+1))
            break

    while lower != 0 or upper != max:
        lower_index -= 1
        upper_index += 1
        lower = get_item(lst, lower_index, 0, max, True)
        upper = get_item(lst, upper_index, 0, max, False)
        res.append((lower, upper+1))

    return res






class HierachyNode():
    def __init__(self, node, type, parent=None):
        self.node = node
        self.type = type #one of Call, Loop, or Top
        self.children =[]
        self.parent = parent
        self.refined_node = None
        self.new_defines =[]
        self.verified = False
        self.result = False
        self.comments = ""

    def prune(self):
        if self.type == "call":
            return False
        else:
            new_children = []
            for child in self.children:
                if not child.prune():
                    new_children.append(child)
            self.children = new_children
            return self.children == []

    def optimize_loop(self):
        for child in self.children:
            child.optimize_loop()
        body = None
        if self.type == "func":
            body = self.node.body
        elif  self.type == "loop":
            body = self.node.stmt
        else:
            return
        if body is not None and len(body.block_items) > 1:
            cyclic_statement_index = []
            for i in range(len(body.block_items)):
                statement = body.block_items[i]
                if find_loops(statement):
                    cyclic_statement_index.append(i)

            if cyclic_statement_index == []:
                return

            new_children = []
            sub_region_map = dict()
            for child in self.children:
                target = child.node
                path = find_node(self.node, target)
                found = False
                for i in range(len(body.block_items)):
                    statement = body.block_items[i]
                    if statement in path:
                        found = True
                        cover = find_cover(cyclic_statement_index, i, len(body.block_items)-1)
                        if len(cover) > 0:
                            cur_node = child
                            created = False
                            for l, u in cover:
                                new_h_node = sub_region_map.get((l,u), None)
                                if new_h_node is None:
                                    new_node = c_ast.Compound(block_items=body.block_items[l : u])
                                    new_h_node = HierachyNode(new_node, "compound", None)
                                    sub_region_map[(l, u)] = new_h_node
                                else:
                                    created = True

                                if new_h_node == cur_node:
                                    continue
                                else:
                                    new_h_node.children.append(cur_node)
                                    cur_node.parent = new_h_node
                                    cur_node = new_h_node

                                if created:
                                    break

                            if not created:
                                cur_node.parent = self
                                new_children.append(cur_node)
                                break
                        else:
                            found = False
                            break
                if not found:
                    new_children.append(child)
            self.children = new_children

    def print(self):
        for child in self.children:
            child.print()
        print(c_generator.CGenerator().visit(self.node))

    def prepare_func(self, type_info):
        for c in self.children:
            c.prepare_func(type_info)
        missing_defs, value_changed, define = find_missing_def(self.node)
        refined_node =deepcopy(self.node)
        new_define  = []
        new_returns = []
        func_ret = is_func_ret(refined_node)
        for missing_def in missing_defs:
           new_define.append(c_ast.Decl(name=missing_def, quals=[], storage=[], init=None, funcspec=[],
                           bitsize=None,  align=[],
                           type=c_ast.TypeDecl(declname=missing_def, quals=[], align=[],
                                               type=c_ast.IdentifierType(get_type(missing_def, type_info)))))

        for changed_name in value_changed:
           if not func_ret and ((changed_name in changed_name) or isinstance(refined_node, c_ast.Compound)):
               new_returns.append(c_ast.Return(c_ast.ID(changed_name)))

        if isinstance(refined_node, c_ast.Compound):
            refined_node.block_items =  refined_node.block_items + new_returns
            new_node = refined_node
            self.new_defines = new_define
        elif isinstance(refined_node, c_ast.While) or isinstance(refined_node, c_ast.For):
            temp_node = c_ast.If(cond=refined_node.cond, iftrue=refined_node.stmt, iffalse=None)
            new_node =  c_ast.Compound(block_items=  [temp_node] + new_returns)
            self.new_defines = new_define
        elif isinstance(refined_node, c_ast.FuncCall):
            new_node = c_ast.Compound(block_items= [c_ast.Return(refined_node)])
            self.new_defines = new_define
        elif isinstance(refined_node, c_ast.FuncDef):
            new_node = refined_node.body
            new_node.block_items =  new_node.block_items + new_returns
            if refined_node.decl.type.args is not None:
                self.new_defines = refined_node.decl.type.args.params + new_define
            else:
                self.new_defines = new_define
        else:
            new_node = refined_node
        #print(c_generator.CGenerator().visit(new_node))
        self.refined_node = new_node


class  HierarchyMaker(c_ast.NodeVisitor):

    def __init__(self, libs, root):
        #lib is a set of library functions
        self.libs = libs
        self.root = root

    def set_root(self, hn):
        self.root = hn

    def visit_FuncCall(self, node):

        if node.name.name in self.libs:
            new_node = HierachyNode(node, "call", self.root)
            self.root.children.append(new_node)

    def visit_For(self, node):
        new_node = HierachyNode(node, "loop", self.root)
        self.root.children.append(new_node)
        HM = HierarchyMaker(self.libs, new_node)
        for c in node:
            HM.visit(c)

    def visit_While(self, node):
        new_node = HierachyNode(node, "loop", self.root)
        self.root.children.append(new_node)
        HM = HierarchyMaker(self.libs, new_node)
        for c in node:
            HM.visit(c)

def analyze_function_hierarchy(func, libs):
    type_info = search_types(func)
    hn = HierachyNode(func, "func")
    HM = HierarchyMaker(libs, hn)
    HM.visit(func)
    hn.prune()
    hn.optimize_loop()
    #hn.print()
    hn.prepare_func(type_info)
    return hn



def find_node(node, target):
    a = nodeHunter(target)
    a.visit(node)
    if a.res:
        res = []
        cur = target
        while cur is not None:
            res.append(cur)
            cur = a.parent_child.get(cur, None)
        return res
    else:
        return []

class nodeHunter(c_ast.NodeVisitor):
    def __init__(self, target):
        self.target = target
        self.parent_child = dict()
        self.res = False

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        for c in node:
            self.parent_child[c] = node
            self.visit(c)

    def visit(self, node):
        if node == self.target:
            self.res = True
        else:
            self.generic_visit(node)

def find_loops(node):
    a = LoopHunter()
    a.visit(node)
    return a.res

class LoopHunter(c_ast.NodeVisitor):

    def __init__(self):
        self.res = False

    def visit_For(self, node):
        self.res = True
        return

    def visit_While(self, node):
        self.res = True

    def visit_doWhile(self, node):
        self.res = True

def search_types(node):
    a = DateTypeVisitor()
    a.visit(node)
    return a.type_dict

class DateTypeVisitor(c_ast.NodeVisitor):

    def __init__(self):
        self.type_dict={}

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            type = node.type
            while (type is not None):
                if isinstance(type, c_ast.FuncDecl):
                    if type.args is not None:
                        self.visit(type.args)
                if isinstance(type, c_ast.IdentifierType):
                    self.type_dict[node.name] = type.names
                    break
                else:
                    try:
                        type = type.type
                    except:
                        break


def find_missing_def(node):
    d = DUVisitor()
    d.visit(node)
    return d.missing_define, d.value_changed, d.define

def set_paramters(func_node, new_args):
    assert isinstance(func_node, c_ast.FuncDef)
    decl = func_node.decl
    while not isinstance(decl, c_ast.FuncDecl):
        decl = decl.type

    decl.args = c_ast.ParamList(params=new_args)

def wrap_body_with_header(body_node, hn):
    function_header = deepcopy(template_function)

    function_header.body = body_node
    if hn.new_defines != []:
        set_paramters(function_header, hn.new_defines)
    return function_header





def get_type(name, t=None):
    global type_dict
    if t is None:
        t = type_dict
    type = t.get(name, None)
    if type is not None:
        return type
    elif name.endswith("_old") or name.endswith("_new"):
        type = t.get(name[:-4], None)
        if type is not None:
            return type

    return ['int']

class DUVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.define = set()
        self.missing_define = set()
        self.value_changed = set()

    def check_and_refine(self, use):
        if (use is None):
            return
        if isinstance(use, str):
            if use not in self.define and use not in self.missing_define:
                self.missing_define.add(use)
        else:
            IDH = IDhunter()
            IDH.visit(use)
            for use in IDH.container:
                if use not in self.define and use not in self.missing_define:
                    self.missing_define.add(use)


    def add_to_define(self, target):
        if (target is None):
            return
        if isinstance(target, str):
            self.define.add(target)
        if isinstance(target.name, str):
            self.define.add(target.name)
        else:
            IDH = IDhunter()
            IDH.visit(target)
            for target in IDH.container:
                self.define.add(target)


    def add_to_changed(self, target):
        if (target is None):
            return
        if isinstance(target, str):
            self.value_changed.add(target)
        else:
            IDH = IDhunter()
            IDH.visit(target)
            for target in IDH.container:
                self.value_changed.add(target)



    def visit_Assignment(self, node):
        if isinstance(node, c_ast.Assignment):
            if node.lvalue is not None:
                self.check_and_refine(node.lvalue)
                self.add_to_changed(node.lvalue)

            if node.rvalue is not None:
                self.check_and_refine(node.rvalue)



    def visit_UnaryOp(self, node):
        if isinstance(node, c_ast.UnaryOp):
            if (node.op.endswith("--") or node.op.endswith("++") ):
                self.add_to_changed(node.expr)
                self.check_and_refine(node.expr)

            elif node.expr is not None:
                self.check_and_refine(node.expr)


    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            self.add_to_define(node)
            if node.type is not None and isinstance(node.type, c_ast.FuncDecl):
                self.visit(node.type)
            if node.init is not None:
                self.check_and_refine(node.init)


    def visit_BinaryOp(self,node):
        if isinstance(node, c_ast.BinaryOp):
            if node.left is not None:
                self.check_and_refine(node.left)
            if node.right is not None:
                self.check_and_refine(node.right)


    def visit_FuncCall(self, node):
        if isinstance(node, c_ast.FuncCall):
            self.check_and_refine(node.args)


class IDhunter(c_ast.NodeVisitor):
    def __init__(self):
        self.container = set()

    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            self.container.add(node.name)

    def visit_FuncCall(self, node):
        if node.args is not None:
            self.visit(node.args)


class DeclHunter(c_ast.NodeVisitor):
    def __init__(self, target):
        self.container = {}
        self.target = target

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            if node.name in self.target:
                self.container[node.name] = deepcopy(node.type)

def is_func_ret(node):
    a = ReturnHunter()
    a.visit(node)
    return a.res

def hunt_returns(node):
    a = ReturnHunter()
    a.visit(node)
    return a.container

def wipe_returns(node):
    a = ReturnWiper()
    a.visit(node)
    a.work()


class ReturnWiper(c_ast.NodeVisitor):
    def __init__(self):
        self.res = []
        self.parent_child = dict()

    def visit_Return(self, node):
        self.res.append((node, self.parent_child.get(node)))

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        for c in node:
            self.parent_child[c] = node
            self.visit(c)

    def work(self):
        for ret, parent in self.res:
            assert isinstance(parent, c_ast.Compound)
            index = parent.block_items.index(ret)
            parent.block_items = parent.block_items[:index] + parent.block_items[index+1:]

class ReturnHunter(c_ast.NodeVisitor):
    def __init__(self):
        self.res = False
        self.container = dict()

    def visit_Return(self, node):
        if isinstance(node, c_ast.Return):
            self.res = True
            name = node.expr
            if isinstance(name, c_ast.ID):
                name_str = name.name
                if name_str.endswith("_old") or name_str.endswith("_new"):
                    origin_name = name_str[:-4]
                    if origin_name in self.container:
                        self.container[origin_name].add(name)
                    else:
                        self.container[origin_name] = set([name])
            else:
                string_rep = c_generator.CGenerator().visit(name)
                if "_old" or "_new" in string_rep:
                    orig_string_rep = string_rep.replace("_old", "XXXX").replace("_new", "XXXX")
                    if orig_string_rep in self.container:
                        self.container[orig_string_rep].add(name)
                    else:
                        self.container[ orig_string_rep] = set([name])



def convert_return(node, type_info):
    a = ReturnToAssign(type_info)
    a.visit(node)
    a.update(node)


class ReturnToAssign(c_ast.NodeVisitor):

    def __init__(self, return_type):
        self.replacement = []
        self.parent_child =dict()
        self.return_name = "CLEVER_RET"
        if return_type == ['void']:
            return_type[0] = 'int'
        self.return_type = return_type

    def update(self, node):
        #first add the declartion of the return
        if self.replacement != []:
            body = []
            if isinstance(node, c_ast.FuncDef):
                body = node.body.block_items
            elif isinstance(node, c_ast.Compound):
                body = node.block_items
            body.insert(0, c_ast.Decl(name=self.return_name, quals=[], storage=[], init=None, funcspec=[],
                               bitsize=None,  align=[],
                               type=c_ast.TypeDecl(declname=self.return_name, quals=[], align=[],
                                                   type=c_ast.IdentifierType(self.return_type))))

            body.append(c_ast.Return(c_ast.ID(name=self.return_name)))
            #now go through all updates:
            for old, p, new in self.replacement:
                if isinstance(p, c_ast.Compound):
                    index = p.block_items.index(old)
                    p.block_items[index] = new
                else:
                    replace_object(p, old, new)


    def visit_Return(self, node):
        if isinstance(node, c_ast.Return):
            new_node = c_ast.Assignment(op='=', lvalue=c_ast.ID(self.return_name), rvalue=node.expr)
            self.replacement.append((node, self.parent_child[node], new_node))

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        for c in node:
            self.parent_child[c] = node
            self.visit(c)


def replace_object(parent, old, new):
    attr_names= dir(parent)
    for attr_name in attr_names:
        attr = getattr(parent, attr_name)
        if attr is not None and attr == old:
            setattr(parent, attr_name, new)
            return