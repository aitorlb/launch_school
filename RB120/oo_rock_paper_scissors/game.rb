
class Player
  CHOICES = ["rock", "paper", "scissors"]
  COMPUTER_NAMES = ["R2D2", "Hal", "Chappie", "Sonny", "Number 5"]

  attr_reader   :move
  attr_accessor :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      answer = nil

      loop do
        puts "What's your name?"
        answer = gets.chomp
        break unless answer.empty?
        puts "Sorry, must enter a value."
      end

      self.name = answer
    else
      self.name = COMPUTER_NAMES.sample
    end
  end

  def choose
    if human?
      choice = nil

      loop do
        puts "Please choose an option: #{CHOICES.join(", ")}"
        choice = gets.chomp
        break if CHOICES.include?(choice)
        puts "Sorry, invalid choice."
      end
      
      self.move = choice
    else
      self.move = CHOICES.sample
    end
  end

  private

  attr_writer :move

  def human?
    @player_type == :human
  end

end

class Move
  def initialize
    # seems like we need something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)

end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human    = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when "rock"
      puts "It's a tie!" if computer.move == "rock"
      puts "#{human.name} won!" if computer.move == "scissors"
      puts "#{computer.name} won!" if computer.move == "paper"
    when "paper"
      puts "It's a tie!" if computer.move == "paper"
      puts "#{human.name} won!" if computer.move == "rock"
      puts "#{computer.name} won!" if computer.move == "scissors"
    when "scissors"
      puts "It's a tie!" if computer.move == "scissors"
      puts "#{human.name} won!" if computer.move == "paper"
      puts "#{computer.name} won!" if computer.move == "rock"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ["y", "n"].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    answer.eql?("y")
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
end

RPSGame.new.play
