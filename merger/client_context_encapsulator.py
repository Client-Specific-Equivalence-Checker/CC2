from pycparser import parse_file, c_generator, c_ast, c_parser
from merger import parser
import copy

def analyze_client(client_node, lib):
    CFV = ClientFUnctionHierarchyVisitor (lib, client_node)
    CFV.visit(client_node)
    return CFV.leaves


'''
Given a fragment of C functions, complete the function by adding approipate input variables
'''
def complete_functions(func_object, client_template, lib):
    func = func_object.node
    if not isinstance(func, c_ast.FuncDef):
        DUV = DUVisitor()
        DUV.visit(func)
        new_func = copy.deepcopy(client_template)

        new_func.decl.name = client_template.decl.name
        new_func.decl.type.type.declname =  client_template.decl.type.type.declname
        new_func.decl.type.args = c_ast.ParamList([])
        new_func.body.block_items = []
        new_func.body.block_items.append(copy.deepcopy(func))
        for missing_def in DUV.missing_define:
            new_func.decl.type.args.params.append(
                                                c_ast.Decl(name=missing_def, quals=[], storage=[], init=None, funcspec=[],
                                                           bitsize=None,
                                                           type=c_ast.TypeDecl(declname=missing_def, quals=[],
                                                                               type=c_ast.IdentifierType(['int']))))

            if missing_def in DUV.value_changed:
                new_func.body.block_items.append(c_ast.Return(c_ast.ID(missing_def)))
    else:
        new_func = func

    func_object.node = parser.version_merge_client(new_func, lib)


    if func != func_object.lib_node:
        func = func_object.lib_node
        if not isinstance(func, c_ast.FuncDef):
            DUV = DUVisitor()
            DUV.visit(func)
            new_func = copy.deepcopy(client_template)

            new_func.decl.name = client_template.decl.name
            new_func.decl.type.type.declname = client_template.decl.type.type.declname
            new_func.decl.type.args = None
            new_func.decl.type.args = c_ast.ParamList([])
            new_func.body.block_items = []
            new_func.body.block_items.append(copy.deepcopy(func))
            for missing_def in DUV.missing_define:
                new_func.decl.type.args.params.append(
                    c_ast.Decl(name=missing_def, quals=[], storage=[], init=None, funcspec=[],
                               bitsize=None,
                               type=c_ast.TypeDecl(declname=missing_def, quals=[],
                                                   type=c_ast.IdentifierType(['int']))))

                if missing_def in DUV.value_changed:
                    new_func.body.block_items.append(c_ast.Return(c_ast.ID(missing_def)))

            func_object.lib_node = new_func
        else:
            func_object.lib_node = new_func

    return func_object








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
        self.visit(node.args)


class ClientFUnctionHierarchyVisitor(c_ast.NodeVisitor):
    def __init__(self, lib_name, client):
        self.lib_name = lib_name
        self.client = client
        self.parent_child = {}
        self.node_dict = {}
        self.leaves = []
        self.root = None

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """

        for c in node:
            self.parent_child[c] = node
            self.visit(c)


    def visit_FuncCall(self, node):
        if isinstance(node, c_ast.FuncCall):
            if isinstance(node.name, c_ast.ID):
                if node.name.name == self.lib_name:
                    l_object = self.create_ClientContextNode(node, node, None, node, None)
                    self.node_dict[node] = l_object
                    self.leaves.append(l_object)
                    c_node = node
                    child_node = node
                    while c_node is not None:
                        pure_loop_check = isinstance(c_node, c_ast.While) or isinstance(c_node,
                                                                                        c_ast.For)
                        loop_type_check = pure_loop_check or isinstance(c_node,
                                                                                                                 c_ast.DoWhile)
                        if loop_type_check or c_node == self.client:
                            c_object = self.node_dict.get(c_node, None)
                            if (c_object is None):
                                if (loop_type_check):
                                    if (isinstance(c_node, c_ast.While)):
                                        child_node_with_loop_context = c_ast.If(cond=c_node.cond, iftrue=child_node, iffalse=None)
                                        c_object = self.create_ClientContextNode(child_node_with_loop_context, c_node, None, c_node,
                                                                                 l_object)
                                    elif isinstance(c_node, c_ast.For):
                                        child_node_with_loop_context = c_ast.If(cond=c_node.cond, iftrue=child_node,
                                                                                iffalse=None)
                                        child_node_with_loop_context_complete = c_ast.Compound(block_items=[c_node.init,child_node_with_loop_context ])
                                        c_object = self.create_ClientContextNode(child_node_with_loop_context_complete, c_node,
                                                                                 None, c_node,
                                                                                 l_object)
                                    else:
                                        c_object = self.create_ClientContextNode(child_node, c_node, None, c_node, l_object)
                                else:
                                    c_object = self.create_ClientContextNode(c_node, c_node, None, c_node, l_object)
                                self.node_dict[c_node]=c_object
                            c_object.children.append(l_object)
                            l_object.parent = c_object
                            l_object = c_object

                        child_node = c_node
                        c_node = self.parent_child.get(c_node, None)

                    self.root = c_object


    def create_ClientContextNode(self, node, lib_node, parent, raw_lib_node, known_child=None):
        hook_installed = False
        if (known_child is not None and known_child.raw_lib_node is not None):
            known_child_content = known_child.raw_lib_node
            child_parent = self.parent_child.get(known_child_content, None)
            if child_parent is not None and isinstance(child_parent, c_ast.Compound):
                index = child_parent.block_items.index(known_child_content)
                child_parent.block_items[index] = c_ast.Compound(block_items=[c_ast.FuncCall(name=c_ast.ID(name="CLEVER_DELETE"), args=None), known_child_content])
                hook_installed = True

        result = complete_functions(ClientContextDag(copy.deepcopy(node), copy.deepcopy(lib_node), parent, raw_lib_node), self.client, self.lib_name)
        if (hook_installed):
            CUV = CleanUpVisitor()
            CUV.visit(result.node)
        return result

class CleanUpVisitor(c_ast.NodeVisitor):

    def __init__(self):
        self.parent_child = {}

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        for c in node:
            self.parent_child[c] = node
            self.visit(c)

    def visit_FuncCall(self,node):
        if isinstance(node, c_ast.FuncCall):
            if (node.name.name == "CLEVER_DELETE"):
                parent = self.parent_child.get(node, None)
                if parent is not None and isinstance(parent, c_ast.Compound):
                    parent.block_items=[c_ast.FuncCall(name=c_ast.ID(name="lib_old"), args=None), c_ast.FuncCall(name=c_ast.ID(name="lib_new"), args=None)]





class ClientContextDag(object):
    def __init__(self, node, lib_node,  parent, raw_lib_node):
        self.node = node
        self.lib_node = lib_node
        self.raw_lib_node = raw_lib_node
        self.parent = parent
        self.children = []
        self.checked = False
        self.processed = False

    def verify_checked(self):
        self.checked = True
        for child in self.children:
            child.verify_checked()
