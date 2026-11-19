
graph = {}

n = int(input("Enter number of edges: "))

for i in range(n):
    u, v = input("Enter edge (A B): ").split()
    graph.setdefault(u, []).append(v)
    graph.setdefault(v, []).append(u)

start = input("Enter start node: ")
goal = input("Enter goal node: ")

def dfs(node, goal, visited, path):
    visited.add(node)
    path.append(node)

    if node == goal:
        print("Path:", " -> ".join(path))
        return True

    for neighbour in graph.get(node, []):
        if neighbour not in visited:
            if dfs(neighbour, goal, visited, path):
                return True

    path.pop()
    return False

if not dfs(start, goal, set(), []):
    print("Path not found.")
