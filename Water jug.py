
from collections import deque
from math import gcd

def water_jug(a, b, target):
    if target < 0 or target > max(a, b):
        print("Target cannot be measured in either jug.")
        return

    if target != 0 and target % gcd(a, b) != 0:
        print("Target cannot be measured with these capacities.")
        return

    queue = deque([(0, 0)])
    parent = {(0, 0): None}

    while queue:
        x, y = queue.popleft()

        if x == target or y == target:
            path = []
            state = (x, y)

            while state is not None:
                path.append(state)
                state = parent[state]

            print("Steps (Jug A, Jug B):")
            for state in reversed(path):
                print(state)
            return

        pour_ab = min(x, b - y)
        pour_ba = min(y, a - x)

        next_states = [
            (a, y), (x, b), (0, y), (x, 0),
            (x - pour_ab, y + pour_ab),
            (x + pour_ba, y - pour_ba)
        ]

        for state in next_states:
            if state not in parent:
                parent[state] = (x, y)
                queue.append(state)

    print("No solution found.")

a = int(input("Enter capacity of Jug A: "))
b = int(input("Enter capacity of Jug B: "))
target = int(input("Enter target quantity: "))

if a <= 0 or b <= 0:
    print("Jug capacities must be positive.")
else:
    water_jug(a, b, target)
