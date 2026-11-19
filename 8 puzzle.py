from queue import PriorityQueue

goal_state = (1, 2, 3, 4, 5, 6, 7, 8, 0)

# Manhattan Distance Heuristic
def heuristic(state):
    distance = 0

    for i in range(3):
        for j in range(3):
            tile = state[i * 3 + j]

            if tile != 0:
                x = (tile - 1) // 3
                y = (tile - 1) % 3

                distance += abs(x - i) + abs(y - j)

    return distance


# Generate successor states
def successors(state):
    result = []
    i = state.index(0)

    # Move left
    if i % 3 != 0:
        s = list(state)
        s[i], s[i - 1] = s[i - 1], s[i]
        result.append(tuple(s))

    # Move right
    if i % 3 != 2:
        s = list(state)
        s[i], s[i + 1] = s[i + 1], s[i]
        result.append(tuple(s))

    # Move up
    if i // 3 != 0:
        s = list(state)
        s[i], s[i - 3] = s[i - 3], s[i]
        result.append(tuple(s))

    # Move down
    if i // 3 != 2:
        s = list(state)
        s[i], s[i + 3] = s[i + 3], s[i]
        result.append(tuple(s))

    return result


# A* Search
def solve(initial):
    frontier = PriorityQueue()

    # (f(n), g(n), state)
    frontier.put((heuristic(initial), 0, initial))

    explored = set()

    while not frontier.empty():
        f, g, state = frontier.get()

        if state == goal_state:
            return True

        if state in explored:
            continue

        explored.add(state)

        for s in successors(state):
            if s not in explored:
                new_g = g + 1
                new_f = new_g + heuristic(s)
                frontier.put((new_f, new_g, s))

    return False


initial_state = (2, 8, 3, 1, 6, 4, 7, 0, 5)

if solve(initial_state):
    print("The puzzle is solvable!")
else:
    print("The puzzle is unsolvable.")
