class Player
  attr_reader   :move
  attr_reader   :name

  def initialize
    set_name
  end

  def set_name
    raise NotImplementedError
  end

  def choose
    raise NotImplementedError
  end

  private

  attr_writer :move
  attr_writer :name
end

class Human < Player
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

  def choose
    choice = nil

    loop do
      puts
      puts "Please choose an option: #{Move::CHOICES.join(', ')}"
      choice = gets.chomp
      break if Move::CHOICES.include?(choice)
      puts "Sorry, invalid choice."
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  NAMES = ["R2D2", "Hal", "Chappie", "Sonny", "Number 5"]

  def set_name
    self.name = NAMES.sample
  end

  def choose
    choice    = Move::CHOICES.sample
    self.move = Move.new(choice)
  end
end

class Move
  include Comparable

  CHOICES = ["rock", "paper", "scissors"]

  attr_reader :choice

  def initialize(choice)
    @choice = choice
  end

  def rock?
    choice == "rock"
  end

  def paper?
    choice == "paper"
  end

  def scissors?
    choice == "scissors"
  end

  def <=>(other_move)
    case choice
    when "rock"
      return +1 if other_move.scissors?
      return 0  if other_move.rock?
      return -1 if other_move.paper?
    when "paper"
      return +1 if other_move.rock?
      return 0  if other_move.paper?
      return -1 if other_move.scissors?
    when "scissors"
      return +1 if other_move.paper?
      return 0  if other_move.scissors?
      return -1 if other_move.rock?
    end
  end

  def to_s
    choice
  end
end

class RPSGame
  def initialize
    @human    = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  private

  attr_reader :human, :computer

  def display_welcome_message
    puts
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_winner
    display_moves

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
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
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end
end

# Require RPS Bonus Features files in order
bonus_features_files = "#{Dir.pwd}/oo_rock_paper_scissors/bonus_features/*.rb"
Dir.glob(bonus_features_files).sort.each { |file| require(file) }

RPSGame.new.play
