from pycparser import parse_file, c_generator, c_ast, c_parser
from pycparser_fake_libc import directory
from CC2.visitor import *
from CC2.checker import merge, DataSynVisitor
from copy import deepcopy

class CallGraph():
    def __init__(self):
        self.nodes = dict()

    def fetch_or_init(self, func_name):
        node =  self.nodes.get(func_name, None)
        if node is None:
            node = CallingNode(func_name)
            self.nodes[func_name] = node

        return node

    def fetch(self, func_name):
        return self.nodes.get(func_name, None)

    def add_call_relation(self, caller_name, callee_name):
        caller = self.fetch_or_init(caller_name)
        callee = self.fetch_or_init(callee_name)
        caller.add_callee(callee_name)
        callee.add_caller(caller_name)

class CallingNode():
    def __init__(self, func_name):
        self.func_name = func_name
        self.old_ver = None
        self.new_ver = None
        self.merged = None
        self.callee = set()
        self.caller = set()

    def add_caller(self, caller):
        self.caller.add(caller)

    def add_callee(self, callee):
        self.callee.add(callee)

    def __repr__(self):
        return self.func_name

def analyze_calls(func_defs, callgraph):
    for func_name, func_body in func_defs.items():
        called_funcs = find_callees(func_body)
        for callee_name in called_funcs:
            callgraph.add_call_relation(func_name, callee_name)


def slice_dependencies(callgraph, lib_name):
    explored = set()
    queue = [lib_name]
    while len(queue) > 0:
        current = queue.pop(0)
        c_node = callgraph.fetch(current)
        for caller in c_node.caller:
            if caller not in explored:
                queue.append(caller)
                print("{} <- {}".format(current, caller))
        explored.add(current)

    return explored




def callAnalyzer(lib_name, client_name, file_ast):
    #lib = find_def(file_ast,lib_name)
    #client = find_def(file_ast, client_name)
    all_func_defs = find_all_def(file_ast)
    lib = all_func_defs.get(lib_name, None)
    assert lib is not None
    client = all_func_defs.get(client_name, None)
    assert client is not None

    type_info = search_types(file_ast)

    callgraph = CallGraph()
    analyze_calls(all_func_defs, callgraph)
    #recursively walk up the the calling context, BFS
    filtered = slice_dependencies(callgraph, lib_name)
    create_alt_versions_versions(callgraph, all_func_defs,  filtered, lib_name = lib_name)
    print(callgraph)

def create_alt_versions_versions(callgraph, all_func_defs, explored, lib_name = ""):
    vr = Verison_Renamer(explored)
    for func in explored:
        func_node = all_func_defs.get(func, None)
        assert func_node is not None

        call_node = callgraph.fetch(func)
        assert call_node is not None

        vr.suffix = "_old"
        call_node.old_ver = deepcopy(func_node)
        vr.visit(call_node.old_ver)

        vr.suffix = "_new"
        call_node.new_ver = deepcopy(func_node)
        vr.visit(call_node.new_ver)

        if lib_name != func:
            hn = analyze_function_hierarchy(func_node, explored)
            call_node.hierarchy = hn
            type_info = search_types(func_node)
            merge_version_hierarchy(hn, explored, type_info)

        #merged_body = merge(deepcopy(call_node.old_ver.body), deepcopy(call_node.new_ver.body))
        #print(c_generator.CGenerator().visit(merged_body))
        #print(c_generator.CGenerator().visit(call_node.old_ver))
        #print(c_generator.CGenerator().visit(call_node.new_ver))

def merge_version_hierarchy(hn, filters, type_info):
    assert isinstance(hn, HierachyNode)
    for c in hn.children:
        merge_version_hierarchy(c, filters, type_info)
    merged = version_and_merge(hn.refined_node, filters)
    add_declartions(merged, type_info, hn)
    convert_ret_into_verification(merged)
    wipe_returns(merged)
    hn.refined_node = wrap_body_with_header(merged)
    print(c_generator.CGenerator().visit(hn.refined_node))

def version_and_merge(node, filters):
    assert isinstance(node, c_ast.Compound)
    new_node = deepcopy(node)
    old_node = deepcopy(node)

    vr = Verison_Renamer(filters, "_new")
    vr.visit(new_node)

    vr.suffix = "_old"
    vr.visit(old_node)

    merged = merge(new_node, old_node)
    return merged

def add_declartions(merged, type_info, hn):
    missing_defs, value_changed = find_missing_def(merged)
    def_rename = dict()
    for md in missing_defs:
        if md.endswith("_old") or md.endswith("_new"):
            original_name = md[:-4]
            if original_name in def_rename:
                def_rename[original_name] += [md]
            else:
                def_rename[original_name] = [md]

    for key, values in def_rename.items():
        new_type = get_type(key, type_info)
        for var_name in values:
            merged.block_items.insert(0, c_ast.Decl(name=var_name, quals=[], storage=[], init=c_ast.ID(name=key), align=[], funcspec=[],
                                                    bitsize=None,
                                                    type=c_ast.TypeDecl(declname=var_name, align=[], quals=[],
                                                                        type=c_ast.IdentifierType(new_type))))
    merged.block_items = hn.new_defines + merged.block_items
    #print(c_generator.CGenerator().visit(merged))
    if len(def_rename) > 0:
        syn = DataSynVisitor(def_rename)
        syn.syncData(merged, None, 0)
    #print(c_generator.CGenerator().visit(merged))

    return merged

def convert_ret_into_verification(node):
    ret_col = hunt_returns(node)
    asserts = []
    for k, v in ret_col.items():
        if len(v) == 2:
            v = list(v)
            arg = c_ast.BinaryOp(op='==', left=v[0], right=v[1])
            asserts.append(c_ast.FuncCall(name=c_ast.ID(name="assert"), args=arg))

    if (isinstance(node, c_ast.Compound)):
        node.block_items += asserts






if __name__ == "__main__":
    fi = load("old.c")
    callAnalyzer("lib", "client", fi)