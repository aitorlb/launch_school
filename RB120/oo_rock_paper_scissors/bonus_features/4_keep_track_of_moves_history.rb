=begin
Keep track of a history of moves

As long as the user doesn't quit, keep track of a history of moves by both the
human and computer. What data structure will you reach for? Will you use a new
class, or an existing class? What will the display output look like?
=end

class MovesHistory
  def initialize
    @moves_history = []
  end

  def save_player_moves(player1, player2)
    @moves_history << {
      player1.name => player1.move,
      player2.name => player2.move
    }
  end

  def display_moves_history
    puts
    puts 'Moves History:'
    @moves_history.each.with_index(1) do |moves, turn|
      print "Turn #{turn} - "
      print "#{moves.map { |player, move| "#{player} chose #{move}" }.join('; ')}."
      print "\n"
    end
  end
end

class RPSGame
  def initialize
    @human    = Human.new
    @computer = Computer.new
    @moves_history = MovesHistory.new
  end

  def play
    display_welcome_message

    loop do
      winner = nil

      loop do
        human.choose
        computer.choose

        moves_history.save_player_moves(human, computer) # NEW

        display_point_winner
        moves_history.display_moves_history # NEW

        break if winner = game_winner(human, computer)
      end

      display_game_winner(winner)

      break unless play_again?
    end

    display_goodbye_message
  end

  private

  attr_reader :human, :computer, :moves_history
end
