=begin
Add a class for each move

What would happen if we went even further and introduced 5 more classes, one for
each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change?
Can you make it work? After you're done, can you talk about whether this was a
good design decision? What are the pros/cons?
=end

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

class Move
  MOVE_CLASSES = {
    'rock' => Rock,
    'paper' => Paper,
    'scissors' => Scissors,
    'lizard' => Lizard,
    'spock' => Spock
  }.freeze

  def self.for(choice)
    MOVE_CLASSES.fetch(choice).new(choice)
  end

  def <=>(other_move)
    raise(NotImplementedError)
  end
end

class Player
  private

  def set_move(choice)
    self.move = Move.for(choice)
  end
end

class Computer < Player
  def choose
    choice    = Move::CHOICES.sample
    self.move = set_move(choice)
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
end
