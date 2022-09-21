=begin
Add Lizard and Spock

This is a variation on the normal Rock Paper Scissors game by adding two more
options - Lizard and Spock. The rules are:
- Scissors cuts Paper
- Paper covers Rock
- Rock crushes Lizard
- Lizard poisons Spock
- Spock smashes Scissors
- Scissors decapitates Lizard
- Lizard eats Paper
- Paper disproves Spock
- Spock vaporizes Rock
- Rock crushes Scissors
=end

class Move
  CHOICES = %w(rock paper scissors lizard spock)

  CHOICES.each do |choice_name|
    define_method("#{choice_name}?") { choice == choice_name }
  end

  def <=>(other_move)
    case choice
    when 'rock'
      return +1 if other_move.scissors?
      return +1 if other_move.lizard?
      return 0  if other_move.rock?
      return -1  if other_move.paper?
      return -1  if other_move.spock?
    when 'paper'
      return +1 if other_move.rock?
      return +1 if other_move.spock?
      return 0  if other_move.paper?
      return -1  if other_move.scissors?
      return -1  if other_move.lizard?
    when 'scissors'
      return +1 if other_move.paper?
      return +1 if other_move.lizard?
      return 0  if other_move.scissors?
      return -1  if other_move.rock?
      return -1  if other_move.spock?
    when 'spock'
      return +1 if other_move.scissors?
      return +1 if other_move.rock?
      return 0  if other_move.spock?
      return -1  if other_move.paper?
      return -1  if other_move.lizard?
    when 'lizard'
      return +1 if other_move.spock?
      return +1 if other_move.paper?
      return 0  if other_move.lizard?
      return -1  if other_move.rock?
      return -1  if other_move.scissors?
    else
      raise(ArgumentError, "Unrecognized choice '#{choice}'")
    end
  end

  def to_s
    choice
  end
end

class RPSGame
  WELCOME_MESSAGE =
    "Welcome to " +
    Move::CHOICES.map(&:capitalize).join(', ') +
    "! First to reach #{WIN_SCORE} points wins!"
end
