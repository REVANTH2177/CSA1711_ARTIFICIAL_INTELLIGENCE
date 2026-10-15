
def display(board):
    for i in range(0, 9, 3):
        print(" | ".join(board[i:i+3]))
        if i < 6:
            print("---------")

def check_win(board, player):
    wins = [
        (0, 1, 2), (3, 4, 5), (6, 7, 8),
        (0, 3, 6), (1, 4, 7), (2, 5, 8),
        (0, 4, 8), (2, 4, 6)
    ]
    return any(all(board[i] == player for i in line)
               for line in wins)

board = [' '] * 9
player = 'X'

print("Tic Tac Toe Game")
print("Enter positions from 1 to 9")

for turn in range(9):
    display(board)
    while True:
        try:
            pos = int(input(f"Player {player}, enter position: ")) - 1
            if 0 <= pos < 9 and board[pos] == ' ':
                break
            print("Invalid position! Try again.")
        except ValueError:
            print("Enter a number from 1 to 9.")

    board[pos] = player

    if check_win(board, player):
        display(board)
        print("Player", player, "Wins!")
        break

    player = 'O' if player == 'X' else 'X'
else:
    display(board)
    print("Game Draw!")
