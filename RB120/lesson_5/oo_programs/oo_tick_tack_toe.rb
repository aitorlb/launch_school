require 'byebug'

class Board
  WINNABLE_POSITIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [7, 5, 3]
  ]

  POSITION_STRINGS = {
    1 => '¹',
    2 => '²',
    3 => '³',
    4 => '⁴',
    5 => '⁵',
    6 => '⁶',
    7 => '⁷',
    8 => '⁸',
    9 => '⁹',
  }

  attr_reader :winner

  def initialize
    @grid = empty_grid
  end

  def display(positions:)
    display_grid(positions)
  end

  def square_at(position)
    grid.fetch(position) do
      raise(ArgumentError, 'Invalid position')
    end
  end

  def winner?
    WINNABLE_POSITIONS.any? do |positions|
      squares = positions.map { |position| square_at(position) }

      find_winner(squares)
    end
  end

  def full?
    grid.values.all?(&:marked?)
  end

  private

  attr_reader :grid
  attr_writer :winner

  def empty_grid
    (1..9).map { |position| [position, Square.new] }.to_h
  end

  # rubocop:disable Layout/LineLength
  def display_grid(display_position)
    puts '+---+---+---+'
    puts "| #{display_square(1, display_position)} | #{display_square(2, display_position)} | #{display_square(3, display_position)} |"
    puts '+---+---+---+'
    puts "| #{display_square(4, display_position)} | #{display_square(5, display_position)} | #{display_square(6, display_position)} |"
    puts '+---+---+---+'
    puts "| #{display_square(7, display_position)} | #{display_square(8, display_position)} | #{display_square(9, display_position)} |"
    puts '+---+---+---+'
  end
  # rubocop:enable Layout/LineLength

  def display_square(position, display_position)
    square = square_at(position)

    return square unless display_position

    square.marked? ? square : POSITION_STRINGS[position]
  end

  def find_winner(row_of_squares)
    return false unless row_of_squares.all?(&:marked?)
    return false unless row_of_squares.uniq(&:player).one?

    self.winner = row_of_squares.sample.player

    true
  end
end

class Square
  EMPTY_SQUARE = ' '

  attr_reader :mark

  def mark_with_player(player)
    self.mark = Mark.new(player)
  end

  def to_s
    mark&.to_s || EMPTY_SQUARE
  end

  def marked?
    !!mark
  end

  def player
    mark&.player
  end

  private

  attr_writer :mark
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def to_s
    "#{name} (#{marker})"
  end

  def mark(square)
    square.mark_with_player(self)
  end
end

class Mark
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def to_s
    player.marker
  end
end

class TTTGame
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
  end

  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if game_over?

      display_board
      second_player_moves
      break if game_over?
    end
    display_result
    display_goodbye_message
  end

  private

  attr_reader :board, :player1, :player2

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts 'Tic Tac Toe is a 2-player board game played on a 3x3 grid.'
    puts 'Players take turns marking a square.'
    puts 'The first player to mark 3 squares in a row wins.'
    puts "Player 1 has the #{player1.marker.inspect} marker."
    puts "Player 2 has the #{player2.marker.inspect} marker."
  end

  def display_board(with_positions: true)
    puts
    board.display(positions: with_positions)
    puts
  end

  def first_player_moves
    player_move(player1)
  end

  def second_player_moves
    player_move(player2)
  end

  def player_move(player)
    square = nil
    loop do
      position = ask_player_move(player)
      square   = board.square_at(position)
      break unless square.marked?
      puts "Sorry, that square is already marked."
    end
    player.mark(square)
  end

  def ask_player_move(player)
    loop do
      puts
      puts "#{player}, what is your move? Enter a square number."
      input = gets.chomp
      integer = input.then { |string| Integer(string) rescue -1 } # rubocop:disable Style/RescueModifier
      break integer if integer.between?(1, 9)
      puts "Sorry, invalid move."
    end
  end

  def game_over?
    board.winner? || board.full?
  end

  def display_result
    puts
    puts "#{board.winner} WON THE GAME!"
    display_board(with_positions: false)
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end
end

game = TTTGame.new
game.play
