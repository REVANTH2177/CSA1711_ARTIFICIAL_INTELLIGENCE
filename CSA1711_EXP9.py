
from itertools import permutations

def tsp(graph):
    n = len(graph)
    min_cost = float('inf')
    best_path = None

    for path in permutations(range(1, n)):
        route = (0,) + path + (0,)
        cost = 0

        for i in range(n):
            cost += graph[route[i]][route[i + 1]]

        if cost < min_cost:
            min_cost = cost
            best_path = route

    print("Best Path:", best_path)
    print("Minimum Cost:", min_cost)

graph = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

print("Travelling Salesman Problem")
tsp(graph)
