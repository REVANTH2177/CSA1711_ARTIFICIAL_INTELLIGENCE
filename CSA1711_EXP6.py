
def vacuum_cleaner():
    rooms = {'A': 'Dirty', 'B': 'Dirty'}

    print("Initial State:", rooms)

    for room in rooms:
        print("Vacuum at Room", room)

        if rooms[room] == 'Dirty':
            print("Cleaning Room", room)
            rooms[room] = 'Clean'

    print("Final State:", rooms)

vacuum_cleaner()
