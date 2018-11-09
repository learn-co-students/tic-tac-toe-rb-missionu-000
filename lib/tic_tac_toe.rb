WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board(board = [' ',' ',' ',' ',' ',' ',' ',' ',' '])
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def position_taken?(board, index)
  board[index] != '' && board[index] != ' ' && board[index] != nil
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, token)
  board[index] = token
end

def input_to_index(input)
  input.to_i-1
end

def turn_count(board)
  board.select {|position| position != ' '}.length
end

def current_player(board)
  if turn_count(board).even?
    'X'
  else
    'O'
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, index) == true
    move(board, index, token)
    display_board(board)
  else
    puts "Invalid move"
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    (board[win_combination[0]] == board[win_combination[1]]
    && board[win_combination[1]] == board[win_combination[2]]
    && board[win_combination[0]] != ' ')
  end
end

def full?(board)
  board.none?{|spot| spot == " "}
end

def draw?(board)
  won?(board).nil? && full?(board) == true
end

def over?(board)
  !won?(board).nil? || draw?(board) == true
end

def winner(board)
  if won?(board).nil?
    won?(board)
  else
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if !winner(board).nil?
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
