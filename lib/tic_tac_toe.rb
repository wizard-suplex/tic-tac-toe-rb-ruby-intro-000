# Helpers
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
  turn_number = 0
  board.each do |move|
    if move == "X" || move == "O"
      turn_number += 1
    end
  end
  return turn_number
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # center row
  [6, 7, 8], # bottom row
  [0, 3, 6], # first column
  [1, 4, 7], # second column
  [2, 5, 8], # third column
  [0, 4, 8], # diagonal L-R
  [2, 4, 6] # diagonal R-L
]

# Determine if someone has won
def won?(board)
 WIN_COMBINATIONS.detect do |win|
   board[win[0]] == board[win[1]] &&
   board[win[0]] == board[win[2]] &&
   position_taken?(board, win[0])
 end
end

# Determine if the board has been filled
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

# Determine that there has been a draw
def draw?(board)
  full?(board) && !won?(board)
end

# Determine if the game is over
def over?(board)
  won?(board) || draw?(board)
end

# Announce the winner
def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end

# Play the game
def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Winner: #{winner(board)}"
  elsif draw?(board)
    puts "Draw Game."
  end
end