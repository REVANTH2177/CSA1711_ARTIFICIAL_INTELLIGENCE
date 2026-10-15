
def is_safe(region, color, assignment, graph):
    for neighbor in graph[region]:
        if assignment.get(neighbor) == color:
            return False
    return True

def map_coloring(graph, colors, assignment={}):
    if len(assignment) == len(graph):
        return assignment.copy()

    region = next(r for r in graph if r not in assignment)

    for color in colors:
        if is_safe(region, color, assignment, graph):
            assignment[region] = color

            result = map_coloring(graph, colors, assignment)
            if result:
                return result

            del assignment[region]

    return None

graph = {
    'A': ['B', 'C'],
    'B': ['A', 'C', 'D'],
    'C': ['A', 'B', 'D'],
    'D': ['B', 'C']
}

colors = ['Red', 'Green', 'Blue']

solution = map_coloring(graph, colors)

print("Map Coloring using CSP")
if solution:
    for region, color in solution.items():
        print(region, ":", color)
else:
    print("No Solution Found")
