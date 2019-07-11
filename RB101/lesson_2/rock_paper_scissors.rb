VALID_CHOICES = %w(rock paper scissors spock lizard)
WINNER_MOVES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(rock scissors)
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

# https://web.archive.org/web/20181217114425/http://www.samkass.com/theories/RPSSL.html
def win?(player1, player2)
  WINNER_MOVES[player1].include?(player2)
end

def determine_winner(player, computer)
  if win?(player, computer)
    :player
  elsif win?(computer, player)
    :computer
  end
end

def display_results(winner)
  case winner
  when :player
    prompt("You won!")
  when :computer
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_options
  prompt("Choose one:")
  VALID_CHOICES.each_with_index do |option, index|
    prompt("#{index + 1}) #{option.capitalize}")
  end
end

def update_scores(scores, winner)
  return unless winner

  scores[winner] += 1
end

def set_grand_winner!(scores, grand_winner)
  if scores[:player] == 5
    grand_winner.concat("Player")
  elsif scores[:computer] == 5
    grand_winner.concat("Computer")
  end
end

prompt("When either the player or computer reaches five wins, the match is over.")

grand_winner = ''
scores = {
  player: 0,
  computer: 0
}

loop do # main loop
  prompt("Scores: Player #{scores[:player]}; Computer #{scores[:computer]}")
  choice = ''
  loop do
    display_options
    choice = Kernel.gets().chomp().downcase

    if (1..VALID_CHOICES.count).map(&:to_s).include?(choice)
      choice = VALID_CHOICES[choice.to_i - 1]
      break
    else
      prompt("Invalid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice.capitalize}; Computer chose: #{computer_choice.capitalize}")

  winner = determine_winner(choice, computer_choice)
  display_results(winner)

  update_scores(scores, winner)
  set_grand_winner!(scores, grand_winner)
  break unless grand_winner.empty?
end

prompt("#{grand_winner} is the Grand Winner!")
prompt("Final scores: Player #{scores[:player]}; Computer #{scores[:computer]}")
