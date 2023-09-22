import typing
import collections

class Node:
    def __init__(self, parent, value):
        self.parent = parent
        self.value = value
        self.children = []
        self.edges = {}
        self.pred = []
        self.cost = None

def bfs(root, dest=None):
    visited = []
    queue = collections.deque([root])
    while queue:
        n = queue.popleft()
        if dest is not None and n.value == dest:
            return n
        visited.append(n.value)
        for c in n.children:
            if c.value not in visited:
                queue.append(c)
    return visited

def _traverse(visited, node):
    visited.append(node.value)
    for c in node.children:
        if c.value not in visited:
            _traverse(visited, c)

def dfs(root):
    visited = []
    _traverse(visited, root)
    return visited

g1 = {
    '5': ['3', '7'],
    '3': ['2', '4'],
    '7': ['8'],
    '2': [],
    '4': ['8'],
    '8': []
}
def build_graph(data):
    root = Node(None, list(data.keys())[0])
    nodes = {root.value:root}
    for k, v in data.items():
        n = nodes[k]
        for c in v:
            if c not in nodes.keys():
                nodes[c] = Node(n, c)
                n.children.append(nodes[c])
        
    return root
if __name__ == "__main__":
    print(' '.join(bfs(build_graph(g1))))

    g2 = {
        5:[1, 2],
        1: [6, 7],
        2: [9, 8],
    }
    print('Breadth first search')
    print(bfs(build_graph(g2)))

    g3 = {
        'A': ['B', 'C','D'],
        'B': ['E'],
        'C': ['D', 'E'],
        'D': [],
        'E': []
    }

    r = build_graph(g3)
    print('breadth first search')
    print(' '.join(bfs(r)))
    print('depth first search')
    print(' '.join(dfs(r)))
