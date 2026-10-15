
import heapq

def astar(graph, start, goal, h):
    queue = [(h[start], 0, start, [start])]
    best = {start: 0}

    while queue:
        f, g, node, path = heapq.heappop(queue)

        if g > best[node]:
            continue

        if node == goal:
            print("Shortest Path:", path)
            print("Total Cost:", g)
            return

        for neighbour, cost in graph[node]:
            new_g = g + cost

            if new_g < best.get(neighbour, float('inf')):
                best[neighbour] = new_g
                heapq.heappush(
                    queue,
                    (new_g + h[neighbour],
                     new_g, neighbour,
                     path + [neighbour])
                )

    print("No Path Found")

graph = {
    'A': [('B', 1), ('C', 4)],
    'B': [('D', 2)],
    'C': [('D', 1)],
    'D': []
}

h = {'A': 3, 'B': 2, 'C': 1, 'D': 0}

print("A* Search Algorithm")
astar(graph, 'A', 'D', h)
