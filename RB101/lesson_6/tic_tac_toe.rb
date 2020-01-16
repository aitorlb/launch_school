require 'pry'

# Tic Tac Toe game

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

SQUARES = (1..9).to_a.freeze
WINNING_LIES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
  [1, 5, 9], [3, 5, 7] # diagonals
].freeze
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def display_board(brd)
  system "clear"
  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]} "
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]} "
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]} "
  puts
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  SQUARES.each_with_object({}) { |num, hash| hash[num] = ' ' }
end

def empty_squares(brd)
  brd.select { |_k, v| v.strip.empty? }.keys
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  detect_winner(brd).is_a?(String)
end

def same_marker?(brd, squares, marker)
  brd.values_at(*squares).all? { |v| v == marker }
end

def detect_winner(brd)
  WINNING_LIES.each do |line|
    if same_marker?(brd, line, PLAYER_MARKER)
      return "Player"
    elsif same_marker?(brd, line, COMPUTER_MARKER)
      return "Computer"
    end
  end

  nil
end

loop do
  # State of the game
  board = initialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  msg = (winner = detect_winner(board)) ? "#{winner} won!" : "It's a tie!"
  prompt(msg)

  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for playing Tic Tac Toe. Good bye!")
