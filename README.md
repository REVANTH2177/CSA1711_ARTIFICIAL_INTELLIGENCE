from collections import deque
def solve():
    start = (3, 3, 0)
    goal = (0, 0, 1)
    queue = deque([(start, [start])])
    visited = set()

    while queue:
        state, path = queue.popleft()

        if state == goal:
            for step in path:
                print(step)
            return

        m, c, boat = state

        for dm, dc in [(1, 0), (2, 0), (0, 1),
                       (0, 2), (1, 1)]:
            if boat == 0:
                new = (m - dm, c - dc, 1)
            else:
                new = (m + dm, c + dc, 0)

            nm, nc, nb = new

            if (0 <= nm <= 3 and 0 <= nc <= 3
                and (nm == 0 or nm >= nc)
                and (nm == 3 or 3-nm >= 3-nc)
                and new not in visited):
                visited.add(new)
                queue.append((new, path + [new]))

solve()
