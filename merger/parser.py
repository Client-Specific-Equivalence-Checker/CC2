import argparse
from os import path
from pycparser import parse_file, c_generator, c_ast


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


class ReturnHuntVisitor(c_ast.NodeVisitor):
    _method_cache = None

    def __init__(self, return_type, return_name):
        self.return_type = return_type
        self.return_name = return_name

    def visit_Return(self, node, parent, index=0):
        if isinstance(parent, c_ast.Compound):
            assignment = c_ast.Assignment(lvalue=c_ast.ID(self.return_name), rvalue=node.expr, op="=")
            parent.block_items[index] = assignment

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

def merge(old, new, well_formed = True):
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

