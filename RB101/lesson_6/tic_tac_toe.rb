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
WINS_COUNT = 5

def display_board(brd, scr)
  system "clear"
  puts "MARKERS: Player '#{PLAYER_MARKER}'	Computer '#{COMPUTER_MARKER}'"
  puts "RULES: 	 First to #{WINS_COUNT} wins the game"
  puts "SCORE: 	 Player  #{scr[:player]}	Computer  #{scr[:computer]}"
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

def joinor(array, delimiter, last_delimiter = 'or')
  array[0..-2].join(delimiter) + " #{last_delimiter} #{array[-1]}"
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ', 'or')}):"
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
  detect_winner(brd).is_a?(Symbol)
end

def same_marker?(brd, squares, marker)
  brd.values_at(*squares).all? { |v| v == marker }
end

def detect_winner(brd)
  WINNING_LIES.each do |line|
    if same_marker?(brd, line, PLAYER_MARKER)
      return :player
    elsif same_marker?(brd, line, COMPUTER_MARKER)
      return :computer
    end
  end

  nil
end

def increment_score(score, winner)
  return unless winner

  score[winner] += 1
end

def game_ended?(score)
  score.values.any? {|wins| wins >= WINS_COUNT}
end

def score_message(winner, score)
  return "It's a tie!" unless winner

  if game_ended?(score)
    "#{winner.upcase} WON THE GAME!"
  else
    "#{winner.capitalize} won!"
  end
end

score = { computer: 0, player: 0}

loop do
  board = initialize_board

  loop do
    display_board(board, score)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  winner = detect_winner(board)
  increment_score(score, winner)
  display_board(board, score)

  prompt(score_message(winner, score))

  break if game_ended?(score)
  prompt("Play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for playing Tic Tac Toe. Good bye!")
