from pycparser import parse_file, c_generator, c_ast, c_parser
import copy

def analyze_client(client_node, lib):
    CFV = ClientFUnctionHierarchyVisitor (lib, client_node)
    CFV.visit(client_node)
    for node in CFV.leaves:
        while (node.parent is not None):
            node = node.parent
            complete_functions(node, client_node)
    return CFV.leaves


'''
Given a fragment of C functions, complete the function by adding approipate input variables
'''
def complete_functions(func_object, client_template):
    func = func_object.node
    if not isinstance(func, c_ast.FuncDef):
        DUV = DUVisitor()
        DUV.visit(func)
        new_func = copy.deepcopy(client_template)

        new_func.decl.name = client_template.decl.name
        new_func.decl.type.type.declname =  client_template.decl.type.type.declname
        new_func.decl.type.args = None
        new_func.body.block_items = []
        new_func.body.block_items.append(func)
        for missing_def in DUV.missing_define:
            new_func.body.block_items.insert(0,
                                                c_ast.Decl(name=missing_def, quals=[], storage=[], init=None, funcspec=[],
                                                           bitsize=None,
                                                           type=c_ast.TypeDecl(declname=missing_def, quals=[],
                                                                               type=c_ast.IdentifierType(['int']))))
            new_func.body.block_items.append(c_ast.Return(c_ast.ID(missing_def)))

        func_object.node = new_func

    return func_object








class DUVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.define = set()
        self.missing_define = set()

    def check_and_refine(self, use):
        if use not in self.define and use not in self.missing_define:
            self.missing_define.add(use)

    def visit_Assignment(self, node):
        if isinstance(node, c_ast.Assignment):
            if node.lvalue is not None:
                if isinstance(node.lvalue, c_ast.ID):
                    self.check_and_refine(node.lvalue.name)
                else:
                    self.visit(node.lvalue)
            if node.rvalue is not None:
                if isinstance(node.rvalue, c_ast.ID):
                    self.check_and_refine(node.rvalue.name)
                else:
                    self.visit(node.rvalue)


    def visit_UnaryOp(self, node):
        if isinstance(node, c_ast.UnaryOp):
            if (node.op.endswith("--") or node.op.endswith("++") ):
                if isinstance(node.expr, c_ast.ID):
                    self.define.add(node.expr.name)
                    self.check_and_refine(node.expr.name)
                else:
                    self.visit(node.expr)
            elif node.expr is not None:
                if isinstance(node.expr, c_ast.ID):
                    self.check_and_refine(node.expr.name)
                else:
                    self.visit(node.expr)

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            self.define.add(node.name)

            if node.init is not None:
                if isinstance(node.init, c_ast.ID):
                    self.check_and_refine(node.init.name)
                else:
                    self.visit(node.init)

    def visit_BinaryOp(self,node):
        if isinstance(node, c_ast.BinaryOp):
            if node.left is not None:
                if isinstance(node.left, c_ast.ID):
                    self.check_and_refine(node.left)
                else:
                    self.visit(node.left)
            if node.right is not None:
                if isinstance(node.right, c_ast.ID):
                    self.check_and_refine(node.right)
                else:
                    self.visit(node.right)


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
                    l_object = ClientContextDag(node, None)
                    self.node_dict[node] = l_object
                    self.leaves.append(l_object)
                    c_node = node
                    child_node = node
                    while c_node is not None:
                        loop_type_check = isinstance(c_node, c_ast.While) or isinstance(c_node,
                                                                                        c_ast.For) or isinstance(c_node,
                                                                                                                 c_ast.DoWhile)
                        if loop_type_check or c_node == self.client:
                            c_object = self.node_dict.get(c_node, None)
                            if (c_object is None):
                                if (loop_type_check):
                                    c_object = ClientContextDag(child_node, None)
                                else:
                                    c_object = ClientContextDag(c_node, None)
                                self.node_dict[c_node]=c_object
                            c_object.children.append(l_object)
                            l_object.parent = c_object
                            l_object = c_object

                        child_node = c_node
                        c_node = self.parent_child.get(c_node, None)

                    self.root = c_object

class ClientContextDag(object):
    def __init__(self, node,  parent):
        self.node = node
        self.parent = parent
        self.children = []
        self.checked = False