
def minimax(values, depth, index, is_max):
    if depth == 0:
        return values[index]

    left = minimax(values, depth - 1, index * 2, not is_max)
    right = minimax(values, depth - 1, index * 2 + 1, not is_max)

    if is_max:
        return max(left, right)
    return min(left, right)


n = int(input("Enter number of leaf nodes (power of 2): "))
values = list(map(int, input("Enter leaf values: ").split()))

if n != len(values) or n < 2 or n & (n - 1):
    print("Invalid input: enter 2, 4, 8, ... leaf values.")
else:
    depth = n.bit_length() - 1
    print("Best value:", minimax(values, depth, 0, True))
