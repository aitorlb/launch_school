require 'bundler/setup'
Bundler.require

class Move
  include Comparable

  CLASS_NAME_BY_CHOICE = {
    'rock' => 'Rock',
    'paper' => 'Paper',
    'scissors' => 'Scissors',
    'lizard' => 'Lizard',
    'spock' => 'Spock'
  }.freeze
  CHOICES = CLASS_NAME_BY_CHOICE.keys

  def self.for(choice)
    class_name = CLASS_NAME_BY_CHOICE.fetch(choice) do
      raise(ArgumentError, "Unrecognized choice '#{choice}'")
    end

    const_get(class_name).new(choice)
  end

  attr_reader :choice

  def initialize(choice)
    @choice = choice
  end

  CHOICES.each do |choice_name|
    define_method("#{choice_name}?") { choice == choice_name }
  end

  def <=>(other_move)
    raise(NotImplementedError)
  end

  def to_s
    choice
  end
end

class Rock < Move
  def <=>(other_move)
    case other_move
    when Scissors, Lizard
      +1
    when Rock
      0
    when Paper, Spock
      -1
    else
      raise(ArgumentError, "Unrecognized move '#{other_move}'")
    end
  end
end

class Paper < Move
  def <=>(other_move)
    case other_move
    when Rock, Spock
      +1
    when Paper
      0
    when Scissors, Lizard
      -1
    else
      raise(ArgumentError, "Unrecognized move '#{other_move}'")
    end
  end
end

class Scissors < Move
  def <=>(other_move)
    case other_move
    when Paper, Lizard
      +1
    when Scissors
      0
    when Rock, Spock
      -1
    else
      raise(ArgumentError, "Unrecognized move '#{other_move}'")
    end
  end
end

class Spock < Move
  def <=>(other_move)
    case other_move
    when Scissors, Rock
      +1
    when Spock
      0
    when Paper, Lizard
      -1
    else
      raise(ArgumentError, "Unrecognized move '#{other_move}'")
    end
  end
end

class Lizard < Move
  def <=>(other_move)
    case other_move
    when Spock, Paper
      +1
    when Lizard
      0
    when Rock, Scissors
      -1
    else
      raise(ArgumentError, "Unrecognized move '#{other_move}'")
    end
  end
end

class Player
  attr_reader :move
  attr_reader :name
  attr_reader :score

  def initialize
    @score = 0
    set_name
  end

  def increase_score
    self.score += 1
  end

  def choose
    raise NotImplementedError
  end

  private

  attr_writer :move
  attr_writer :name
  attr_writer :score

  def set_name
    raise NotImplementedError
  end

  def set_move(choice) # rubocop:disable Naming/AccessorMethodName
    self.move = Move.for(choice)
  end
end

class Human < Player
  def choose
    choice = nil

    loop do
      puts
      puts "Please choose an option: #{Move::CHOICES.join(', ')}"
      choice = gets.chomp
      break if Move::CHOICES.include?(choice)
      puts "Sorry, invalid choice."
    end

    self.move = set_move(choice)
  end

  private

  def set_name
    answer = nil

    loop do
      puts
      puts "What's your name?"
      answer = gets.chomp
      break unless answer.empty?
      puts "Sorry, must enter a value."
    end

    self.name = answer
  end
end

class Computer < Player
  CLASS_NAMES = ["R2D2", "Hal", "Chappie", "Sonny", "Number5"]

  def self.sample_player
    const_get(CLASS_NAMES.sample).new
  end

  def choose
    choice    = Move::CHOICES.sample
    self.move = set_move(choice)
  end

  private

  def set_name
    self.name = self.class.name
  end
end

class R2D2 < Computer
  def choose
    self.move = set_move('rock')
  end
end

class Hal < Computer
  def choose
    choice = rand(1..5) > 4 ? 'rock' : 'scissors'
    self.move = set_move(choice)
  end
end

class Chappie < Computer
  def choose
    self.move = set_move('lizard')
  end
end

class Sonny < Computer
end

class Number5 < Computer
  def choose
    self.move = set_move('spock')
  end

  private

  def set_name
    self.name = 'Number 5'
  end
end

class MovesHistory
  def initialize
    @moves_history = []
  end

  def save_player_moves(player1, player2, point_winner)
    @moves_history << {
      player1.name => "#{player1.move} #{win_status(player1, point_winner)}",
      player2.name => "#{player2.move} #{win_status(player2, point_winner)}"
    }
  end

  def display_moves_history
    puts
    puts 'Moves History:'
    @moves_history.each.with_index(1) do |moves, turn|
      print "Turn #{turn}: "
      display_moves(moves)
    end
  end

  private

  def win_status(player, point_winner)
    return '(T)' unless point_winner

    "(#{player == point_winner ? 'W' : 'L'})"
  end

  def display_moves(moves)
    puts "#{moves.map { |player, move| "#{player} chose #{move}" }.join('; ')}."
  end
end

class RPSGame
  DEFAULT_WIN_SCORE = 3

  def initialize(win_score: DEFAULT_WIN_SCORE)
    @human    = Human.new
    @computer = Computer.sample_player
    @moves_history = MovesHistory.new
    @win_score = win_score
  end

  def play
    display_welcome_message

    game_loop do
      point_loop
    end

    display_goodbye_message
  end

  private

  attr_reader :human, :computer, :moves_history, :win_score

  def game_loop
    loop do
      game_winner = yield

      display_game_winner(game_winner)

      break unless play_again?
    end
  end

  def point_loop
    loop do
      get_player_moves
      display_moves

      point_winner = find_point_winner(human, computer)
      display_point_winner(point_winner)
      moves_history.save_player_moves(human, computer, point_winner)

      display_score

      game_winner = find_game_winner(human, computer)
      break game_winner if game_winner
    end
  end

  def display_welcome_message
    puts
    puts "Hello, #{human.name} 👋"
    puts "Welcome to #{Move::CHOICES.map(&:capitalize).join(', ')}!"
    puts "You are playing against #{computer.name} 🤖"
    puts "First to reach #{win_score} points wins!"
  end

  def get_player_moves # rubocop:disable Naming/AccessorMethodName
    human.choose
    computer.choose
  end

  def find_point_winner(player1, player2)
    if player1.move > player2.move
      player1.increase_score
      player1
    elsif player1.move < player2.move
      player2.increase_score
      player2
    end
  end

  def display_point_winner(point_winner)
    return "\nIt's a tie!" unless point_winner

    puts "\n#{point_winner.name} won the point!"
  end

  def display_score
    puts
    puts "Score (best of #{win_score}):"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score}"
  end

  def find_game_winner(*players)
    players.find { |player| player.score >= win_score }
  end

  def display_game_winner(player)
    puts
    puts "#{player.name} won the game!"
    moves_history.display_moves_history
  end

  def display_moves
    puts
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def play_again?
    answer = nil

    loop do
      puts
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ["y", "n"].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    answer.eql?("y")
  end

  def display_goodbye_message
    puts
    puts "Thanks for playing to #{Move::CHOICES.map(&:capitalize).join(', ')}!"
  end
end

RPSGame.new(win_score: 1).play
