require 'pry'

# Twenty-One

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# 52-card deck
# 4 suits (hearts, diamonds, clubs, and spades)
# 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).

SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def prompt(msg)
  puts "=> #{msg}"
  puts
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total)
  total > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)
  if dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def joinor(array, delimiter, last_delimiter = 'or')
  array[0..-2].join(delimiter) + " #{last_delimiter} #{array[-1]}"
end

def display_hand(title, cards, total)
  cards_array = cards.map { |e| "|#{e.join(' ')}|" }
  cards_string = joinor(cards_array, ', ', 'and')
  prompt "#{title.upcase}\n   Cards: #{cards_string}\n   Total: #{total}"
end

def compare_cards(dealer_cards, dealer_total, player_cards, player_total)
  puts "========================================================"
  display_hand("dealer", dealer_cards, dealer_total)
  display_hand("player", player_cards, player_total)
  puts "========================================================"
  display_result(dealer_total, player_total)
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def hit(deck, cards)
  cards << deck.pop
  [cards, total(cards)]
end

loop do
  system "clear"
  prompt "Welcome to Twenty-One!"

  prompt "Dealing..."
  sleep 1

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  # cache each player's total
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  display_hand("dealer", [dealer_cards[0], ["?", "?"]], "?")
  display_hand("you", player_cards, player_total)

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      prompt "You chose to hit!"
      player_cards, player_total = hit(deck, player_cards)
      display_hand("you", player_cards, player_total)
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    prompt "You busted! Dealer wins!"
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  display_hand("dealer", dealer_cards, dealer_total)

  loop do
    sleep 1
    break if dealer_total >= 17

    prompt "Dealer hits!"
    dealer_cards, dealer_total = hit(deck, dealer_cards)
    display_hand("dealer", dealer_cards, dealer_total)
  end

  if busted?(dealer_total)
    prompt "Dealer busted! You win!"
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  # compare_cards(dealer_cards, dealer_total, player_cards, player_total)

  sleep 1
  display_result(dealer_total, player_total)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
