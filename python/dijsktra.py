import typing
from heapq import heapify, heappush, heappop


import bfs

def _find_cost(visited, node: bfs.Node):
    visited.append(node.value)
    min = None
    child = None
    for e, c in node.edges.items():
        if min is None or min > (node.cost + c):
            min = node.cost + c
            child = e
            print(f'cost is now {min} of value {e.value}')

    child.pred = list(node.value) + node.pred
    child.cost = min
    return child



def dijsktra(graph, source, destination):
    node = bfs.bfs(graph, dest=source)
    print(f'node value is {node.value}')
    node.cost = 0
    visited = []
    min_heap = [(0, root.value)]
    while node.value is not destination:
        node = _find_cost(visited, node)
    visited.append(node.value)
    return node.cost, visited


    
g1 = {
    'A': {'B':2, 'C': 4},
    'B': {'A':2, 'C': 3, 'D':8},
    'C': {'A':4, 'B': 3, 'E': 5, 'D':2},
    'D': {'B': 8, 'C': 2, 'E': 11, 'F':22},
    'E': {'C': 5, 'D':11, 'F':1},
    'F':{'D': 22, 'E':1}
}

def build_graphs(data):
    root = bfs.Node(None, list(data.keys())[0])
    nodes = {root.value:root}
    for k, v in data.items():
        n = nodes[k]
        for c, e in v.items():
            if c not in nodes.keys():
                nodes[c] = bfs.Node(n, c)
                n.edges[nodes[c]] = e
                n.children.append(nodes[c])
    return root
source = 'A'
destination = 'F'

r = build_graphs(g1)
cost, path = dijsktra(r, source, destination)
print(cost)
print(path)
