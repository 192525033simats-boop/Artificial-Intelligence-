"""Find an arrangement of eight queens with no attacks."""


def solve_n_queens(n=8):
    """Return one solution as column positions, one per row; None if absent."""
    placement = []
    used_columns, down_diagonals, up_diagonals = set(), set(), set()

    def place(row):
        if row == n:
            return placement.copy()
        for col in range(n):
            if (col in used_columns or row - col in down_diagonals
                    or row + col in up_diagonals):
                continue
            placement.append(col)
            used_columns.add(col)
            down_diagonals.add(row - col)
            up_diagonals.add(row + col)
            result = place(row + 1)
            if result is not None:
                return result
            placement.pop()
            used_columns.remove(col)
            down_diagonals.remove(row - col)
            up_diagonals.remove(row + col)
        return None

    return place(0)


def print_board(solution):
    for col in solution:
        print(" ".join("Q" if c == col else "." for c in range(len(solution))))


if __name__ == "__main__":
    answer = solve_n_queens(8)
    print("One 8-Queens solution (Q marks a queen):")
    print_board(answer)
