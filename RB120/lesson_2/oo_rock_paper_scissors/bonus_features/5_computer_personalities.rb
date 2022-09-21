=begin
Computer personalities

We have a list of robot names for our Computer class, but other than the name,
there's really nothing different about each of them. It'd be interesting to
explore how to build different personalities for each robot. For example,
R2D2 can always choose "rock". Or, "Hal" can have a very high tendency to
choose "scissors", and rarely "rock", but never "paper". You can come up with
the rules or personalities for each robot. How would you approach a feature
like this?
=end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = set_move('rock')
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    choice = rand(1..5) > 4 ? 'rock' : 'scissors'
    self.move = set_move(choice)
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end

  def choose
    self.move = set_move('lizard')
  end
end

class Sonny < Computer
  def set_name
    self.name = 'Sonny'
  end
end

class Number5 < Computer
  def set_name
    self.name = 'Number5'
  end

  def choose
    self.move = set_move('spock')
  end
end

class Computer < Player
  CLASSES = [R2D2, Hal, Chappie, Sonny, Number5]

  def self.sample_player
    CLASSES.sample.new
  end
end

class RPSGame
  def initialize
    @human    = Human.new
    @computer = Computer.sample_player
    @moves_history = MovesHistory.new
  end

  private

  def display_welcome_message
    puts
    puts "Hello, #{human.name}!"
    puts "Welcome to #{Move::CHOICES.map(&:capitalize).join(', ')}!"
    puts "You are playing against #{computer.name}."
    puts "First to reach #{WIN_SCORE} points wins!"
  end
end
