=begin
RPS Bonus Features: Keeping score

Right now, the game doesn't have very much dramatic flair. It'll be more 
interesting if we were playing up to, say, 10 points. Whoever reaches 10 points 
first wins. Can you build this functionality? We have a new noun -- a score. Is 
that a new class, or a state of an existing class? You can explore both options 
and see which one works better.
=end

require_relative "../rps_game.rb"

module Scorable
  attr_reader :score

  def initialize
    @score = 0
    super
  end

  def increase_score
    @score += 1
  end
end

class Player
  prepend Scorable
end

class RPSGame
  WELCOME_MESSAGE = "Welcome to Rock, Paper, Scissors! First to reach 10 points wins!"

  def display_welcome_message
    puts WELCOME_MESSAGE
  end

  def display_winner
    display_moves

    if human.move > computer.move
      player_won(human)
    elsif computer.move < human.move
      player_won(computer)
    else
      puts "It's a tie!"
    end

    display_result
  end

  def player_won(player)
    player.increase_score
    puts "#{player.name} won!"
  end

  def display_result
    puts "Score:"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score}"
  end
end



# module Scorable
#   def display_welcome_message
#     puts "Welcome to Rock, Paper, Scissors! First to reach 10 points wins!"
#   end

#   def display_winner
#     display_moves

#     if human.move > computer.move

#       puts "#{human.name} won!"
#     elsif computer.move < human.move
#       puts "#{computer.name} won!"
#     else
#       puts "It's a tie!"
#     end
#   end
# end

# class RPSGame
#   prepend Scorable
# end

# p RPSGame.ancestors
RPSGame.new.play
