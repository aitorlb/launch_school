=begin
RPS Bonus Features: Keeping score

Right now, the game doesn't have very much dramatic flair. It'll be more
interesting if we were playing up to, say, 10 points. Whoever reaches 10 points
first wins. Can you build this functionality? We have a new noun -- a score. Is
that a new class, or a state of an existing class? You can explore both options
and see which one works better.
=end

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
  WIN_SCORE = 10
  WELCOME_MESSAGE =
    "Welcome to Rock, Paper, Scissors! First to reach #{WIN_SCORE} points wins!"

  def play
    display_welcome_message

    loop do
      winner = nil

      loop do
        human.choose
        computer.choose
        display_point_winner

        break if winner = game_winner(human, computer)
      end

      display_game_winner(winner)

      break unless play_again?
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts
    puts WELCOME_MESSAGE
    puts
  end

  def display_point_winner
    display_moves

    if human.move > computer.move
      player_won_point(human)
    elsif human.move < computer.move
      player_won_point(computer)
    else
      puts "It's a tie!"
    end

    display_score
  end

  def player_won_point(player)
    puts
    player.increase_score
    puts "#{player.name} won!"
  end

  def display_score
    puts
    puts "Score:"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score}"
  end

  def game_winner(*players)
    players.find { |player| player.score == WIN_SCORE }
  end

  def display_game_winner(player)
    puts
    puts "#{player.name} won the game!"
    display_score
  end
end
