import argparse
from os import path
from pycparser import parse_file, c_generator, c_ast

impacted = False
old_touched = set()
new_touched = set()
touched = set()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--new', type=str, dest='new', default="new.c", help ="new source file" )
    parser.add_argument('--old', type=str, dest ='old', default="old.c", help="old source file")
    parser.add_argument('--client', type=str, dest ='client', default="client", help="client function name" )
    parser.add_argument('--lib', type=str, dest='lib', default="lib", help="lib function name")
    args = parser.parse_args()
    path_old = args.old
    path_new = args.new
    if path.isfile(path_old) and path.isfile(path_new):
        merge_files (path_old, path_new, args.client, args.lib)
    else:
        print("invalid input files")
        exit(1)

class FuncDefVisitor(c_ast.NodeVisitor):
    def __init__(self, target):
        self.target = target
        self.container = None

    def visit_FuncDef(self, node):
        if (self.container is None and node.decl.name == self.target):
            self.container = node
            return
'''
Version and Rename touched variables
'''
class IDRenameVisitor(c_ast.NodeVisitor):
    def __init__(self, version, targets):
        self.version = version
        self.targets = targets

    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            if not node.name.endswith("_"+self.version)and node.name in self.targets:
                node.name = (node.name+"_"+ self.version)

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            if not node.name.endswith("_" + self.version) and node.name in self.targets:
                node.name = (node.name + "_" + self.version)
            if isinstance(node.type, c_ast.TypeDecl):
                if not node.type.declname.endswith("_"+self.version)and node.type.declname in self.targets:
                    node.type.declname = (node.type.declname+"_"+ self.version)


'''
Data flow analysis on AST to determine 
touched variables.
'''
class DataModVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.define = set()
        self.use = set()

    def visit_Assignment(self, node):
        if isinstance(node, c_ast.Assignment):
            if isinstance(node.lvalue , c_ast.ID):
                self.define.add(node.lvalue.name)
            if isinstance(node.rvalue , c_ast.ID):
                self.use.add(node.rvalue.name)

    def visit_UnaryOp(self, node):
        if isinstance(node, c_ast.UnaryOp):
            if isinstance(node.expr, c_ast.ID):
                self.define.add(node.expr.name)

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            if isinstance(node.type, c_ast.TypeDecl):
                self.define.add(node.type.declname)
            if isinstance(node.init , c_ast.ID):
                self.use.add(node.init.name)


class ReturnHuntVisitor(c_ast.NodeVisitor):
    _method_cache = None

    def __init__(self, return_type, return_name):
        self.return_type = return_type
        self.return_name = return_name

    def visit_Return(self, node, parent, index=0):
        assignment = c_ast.Assignment(lvalue=c_ast.ID(self.return_name), rvalue=node.expr, op="=")
        if isinstance(parent, c_ast.Compound):
            parent.block_items[index] = assignment
        elif isinstance(parent, c_ast.If):
            if (index == 1):
                parent.iftrue = assignment
            elif (index == 2):
                parent.iffalse = assignment

    def visit(self, node, parent, index=0):
        """ Visit a node.
        """

        if self._method_cache is None:
            self._method_cache = {}

        visitor = self._method_cache.get(node.__class__.__name__, None)
        if visitor is None:
            method = 'visit_' + node.__class__.__name__
            visitor = getattr(self, method, self.generic_visit)
            self._method_cache[node.__class__.__name__] = visitor

        return visitor(node, parent, index)

    def generic_visit(self, node, parent, index=0):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        counter = 0
        for c in node:
            self.visit(c, node, counter)
            counter+=1


def list_merge(old_list, new_list, old_start, new_start, old_limit, new_limit, target):
    while (old_start < old_limit or new_start < new_limit):
        if (old_start < old_limit and new_start < new_limit):
            add_nodes(target, merge(old_list[old_start], new_list[new_start] ,well_formed=False))
            old_start += 1
            new_start += 1
        elif old_start < old_limit:
            target.append(merge(old_list[old_start], None))
            old_start += 1
        elif new_start < new_limit:
            target.append(merge(None, new_list[new_start]))
            new_start += 1

def merge_expressions(old, new):
    if str(new.next) == str(old.next):
        return new.next
    if isinstance(new.next, c_ast.ExprList):
        exprs = set(new.next.exprs)
    else:
        exprs = set(new.next)

    if isinstance(old.next, c_ast.ExprList):
        exprs.union(set(old.next.exprs))
    else:
        exprs.union(set(old.next))

    return c_ast.ExprList(list(exprs))

def add_nodes (node_list, new_node):
    if isinstance(new_node, list):
        node_list+=new_node
    else:
        node_list.append(new_node)

def mark_touched_variables(old, new):
    global impacted
    global old_touched
    global new_touched
    global touched
    dv_old = DataModVisitor()
    dv_old.visit(old);
    old_touched = old_touched.union(dv_old.define)
    dv_new = DataModVisitor()
    dv_new.visit(new);
    new_touched = new_touched.union(dv_new.define)

    # now look at the use set. use set is considered if it has an intesection with define set.
    old_touched = old_touched.union(dv_old.use.intersection(new_touched))
    new_touched = new_touched.union(dv_new.use.intersection(old_touched))

    new_int = old_touched.intersection(new_touched)
    set_of_interest = new_int.difference(touched)
    touched = new_int
    return set_of_interest;

def rename_ID(old, new, touched_set):
    if (len(touched_set) > 0):
        renamer = IDRenameVisitor("", list(touched_set))
        if (old is not None):
            renamer.version = "old"
            renamer.visit(old)
        if (new is not None):
            renamer.version = "new"
            renamer.visit(new)


def merge(old, new, well_formed = True):
    global touched
    rename_ID(old, new, touched)
    #case 1, new and old are syntactically identical
    if (str(new) == str(old)):
        return new
    #case 2, if one side is empty:
    elif old is None:
        return new
    elif new is None:
        return old
    #case 3, new or old are compound block
    elif isinstance(new, c_ast.Compound) or isinstance(new, c_ast.Compound):
        if (new, c_ast.Compound):
            new_blocks =new.block_items
        else:
            new_blocks = [new]
        if isinstance(old, c_ast.Compound):
            old_blocks = old.block_items
        else:
            old_blocks = [old]
        merged = []

        #try to find loop block
        old_loop_node_index =[]
        new_loop_node_index= []

        for i in range(len(old_blocks)):
            block = old_blocks[i]
            if (isinstance(block, c_ast.For) or
                    isinstance(block, c_ast.While) or
                        isinstance(block, c_ast.DoWhile)):
                old_loop_node_index.append(i)

        for i in range(len(new_blocks)):
            block = new_blocks[i]
            if (isinstance(block, c_ast.For) or
                    isinstance(block, c_ast.While) or
                    isinstance(block, c_ast.DoWhile)):
                new_loop_node_index.append(i)

        cur_old_i = 0
        cur_new_i = 0
        merging_loop_index = 0
        while (merging_loop_index < min(len(new_loop_node_index), len(old_loop_node_index))):
            cur_old_loop_i = old_loop_node_index[merging_loop_index]
            cur_new_loop_i = new_loop_node_index[merging_loop_index]

            list_merge(old_blocks, new_blocks, cur_old_i, cur_new_i, cur_old_loop_i, cur_new_loop_i, merged)

            add_nodes(merged, merge(old_blocks[cur_old_loop_i], new_blocks[cur_new_loop_i], well_formed=False))
            cur_old_i = cur_old_loop_i+1
            cur_new_i = cur_new_loop_i+1
            merging_loop_index += 1

        list_merge(old_blocks, new_blocks, cur_old_i, cur_new_i, len(old_blocks), len(new_blocks), merged)

        return c_ast.Compound(merged)


    #case 4, if the two nodes disagree in types
    elif type(new) != type(old):
        touched_set = mark_touched_variables(old, new)
        if (len(touched_set) > 0):
            renamer = IDRenameVisitor("old", list(touched_set))
            renamer.visit(old)
            renamer.version = "new"
            renamer.visit(new)
        if (well_formed):
            return c_ast.Compound([old, new])
        else:
            return [old, new]

    #case 6, merge decls
    elif isinstance(new, c_ast.DeclList) and isinstance(old, c_ast.DeclList):
        return c_ast.DeclList(decls=( list(set(new.decls + old.decls))))

    #case 5, merge for loops
    elif isinstance(new, c_ast.For) and isinstance(old, c_ast.For):
        #in case the loop cond is identical
        disjunct_for_cond = c_ast.BinaryOp(left=old.cond, right=new.cond, op='||')
        old_statement = c_ast.If(cond=old.cond, iftrue=old.stmt, iffalse=None)
        new_statement = c_ast.If(cond=new.cond, iftrue=new.stmt, iffalse=None)
        loop_body = c_ast.Compound([old_statement, new_statement])
        merged_exp = merge_expressions(old, new)
        merged_for =  c_ast.For(init=merge(new.init, old.init), next=merged_exp, cond= disjunct_for_cond, stmt=loop_body)

        return merged_for

    #case 6, merge while loops
    elif isinstance(new, c_ast.While) and isinstance(old, c_ast.While):
        #in case the loop cond is identical
        disjunct_while_cond = c_ast.BinaryOp(left=old.cond, right=new.cond, op='||')
        old_statement = c_ast.If(cond=old.cond, iftrue=old.stmt, iffalse=None)
        new_statement = c_ast.If(cond=new.cond, iftrue=new.stmt, iffalse=None)
        loop_body = c_ast.Compound([old_statement, new_statement])
        merged_while =  c_ast.While(cond= disjunct_while_cond, stmt= loop_body)
        return merged_while

    #case 7 merge if conditions
    elif isinstance(new, c_ast.If) and isinstance(old, c_ast.If):
        #if with exactly same branching conditions. If prior difference has been detected,
        #conditional var will be renamed.
        if (str(new.cond) == str(old.cond)):
            return c_ast.If(cond=new.cond, iftrue= merge(old.iftrue, new.iftrue ), iffalse=merge(old.iffalse, new.iffalse))

    #cannot merge if get here, check we need to versions variables.
    touched_set = mark_touched_variables(old, new)
    if (len(touched_set) > 0):
        renamer = IDRenameVisitor("old", list(touched_set))
        renamer.visit(old)
        renamer.version = "new"
        renamer.visit(new)
    if (well_formed):
        return c_ast.Compound([old, new])
    else:
        return [old, new]

def merge_files (path_old, path_new, client, lib):
    old_ast = parse_file(path_old)
    new_ast = parse_file(path_new)
    #now look for lib from both versions

    old_lib_visitor = FuncDefVisitor(lib)
    old_lib_visitor.visit(old_ast)
    old_lib_node = old_lib_visitor.container
    assert not old_lib_node is None, "old lib does not exist"


    new_lib_visitor =  FuncDefVisitor(lib)
    new_lib_visitor.visit(new_ast)
    new_lib_node = new_lib_visitor.container
    assert not new_lib_node is None, "new lib does not exist"


    #check both lib have the same signature
    assert str(new_lib_node.decl.type) == str(old_lib_node.decl.type) , "lib functions signature mismatch"

    #convert returns into assignment
    ret_v = ReturnHuntVisitor("int", "ret_old")
    ret_v.visit(old_lib_node, None)
    old_lib_node.body.block_items.insert(0, c_ast.Decl(name="ret_old", quals=[], storage=[], init=None, funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname="ret_old", quals=[], type=c_ast.IdentifierType(['int']))))
    ret_v = ReturnHuntVisitor("int", "ret_new")
    ret_v.visit(new_lib_node, None)
    new_lib_node.body.block_items.insert(0, c_ast.Decl(name="ret_new", quals=[], storage=[], init=None, funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname="ret_new", quals=[], type=c_ast.IdentifierType(['int']))))

    merged_ast = merge(old_lib_node.body, new_lib_node.body)



    generator = c_generator.CGenerator()
    print(generator.visit(merged_ast))
    return

if __name__ == "__main__":
    main()

