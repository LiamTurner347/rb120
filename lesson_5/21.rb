=begin
1. Description of problem

Twenty-One is a card game consisting of a dealer
and a player, where the participants try to get
as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt
  2 cards from a 52-card deck.
- The player takes the first turn,
  and can "hit" or "stay".
- If the player busts, he loses.
  If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to
  at least 17.
- If he busts, the player wins.
  If both player and dealer stays,
  then the highest total wins.
- If both totals are equal, then it's a tie,
  and nobody wins.

2. Extract 'nouns' and 'verbs'

Nouns: card, player, dealer, participant,
        deck, game, total

Verbs: deal, hit, stay, busts

3. Write out classes (nouns) and organise verbs

Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here, or in Deck?)
Participant
Deck
- deal (should this be here, or in Dealer?)
Card
Game
- start

4. Spike!
=end

class Participant
  attr_reader :name, :cards

  def initialize
    @cards = []
    @name = set_name
  end

  def add_card(new_card)
    @cards << new_card
  end

  def busted?
    total > 21
  end

  def total
    total = 0
    cards.each do |card|
      if card.value == "Ace"
        value = 11
      elsif %w(Jack Queen King).include?(card.value)
        value = 10
      else
        value = card.value
      end
      total += value
    end

    num_aces = cards.count { |card| card.value == "Ace" }
    if total > 21 && num_aces > 0
      num_aces.times do
        break if total <= 21
        total -= 10
      end
    end

    total
  end

  def display_total
    puts "You are on a total of #{total}"
  end

  def show_hand
    puts "#{name}'s hand is:"
    cards.each do |card|
      puts card
    end
    puts ""
  end
end

class Player < Participant
  def set_name
    player_name = nil
    loop do
      puts "What is your name?"
      player_name = gets.chomp
      break unless player_name.length.empty?
      puts "That is not a valid name - try again."
    end
    player_name
  end

  def show_flop
    puts "Your first two cards are:"
    cards.each do |card|
      puts card
    end
    puts ""
  end
end

class Dealer < Participant
  def set_name
    "Wheeler Dealer"
  end

  def show_flop
    puts "The #{name} has:"
    puts "#{cards.first}"
    puts "?"
    puts ""
  end
end

class Deck
  SUITS = ["Hearts", "Clubs", "Spades", "Diamonds"]
  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]

  attr_accessor :deck

  def initialize
    @deck = []
    populate_deck
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def populate_deck
    SUITS.each do |suit|
      CARDS.each do |card|
        deck << Card.new(suit, card)
      end
    end
  end

  def deal_one
    deck.pop
  end

  def shuffle
    deck.shuffle!
  end
end

class Card

  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "The #{value} of #{suit}"
  end
end

class Game
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn unless player.busted?
    show_result
    display_goodbye_message
  end

  def display_welcome_message
    clear
    puts "Welcome to 21 #{player.name}!"
    puts "It's you against the #{dealer.name} - closest to 21 wins"
    puts ""
  end

  def deal_cards
    deck.shuffle
    2.times do |_|
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_initial_cards
    player.show_flop
    dealer.show_flop
  end

  def player_turn
    puts "It's your turn:"
    loop do
      break if stick_or_twist == "stick"
      clear
      player.add_card(deck.deal_one)
      player.show_hand
      player.display_total
      break if player.busted?
    end
  end

  def stick_or_twist
    answer = nil
    loop do
      puts "Would you like to stick or twist? (s / t)"
      answer = gets.chomp
      break if %w(t s).include?(answer)
      puts "Invalid answer - please use 's' for stick or 't' for twist"
    end
    return "stick" if answer == "s"
  end

  def dealer_turn
    clear
    puts "It's the dealer's turn:"
    sleep 5
    loop do
      dealer.add_card(deck.deal_one) unless dealer.total >= 17
      break if dealer.total >= 17 || dealer.busted?
    end
  end

  def show_result
    if player.busted?
      puts "You busted. The #{dealer.name} wins this time"
    elsif dealer.busted?
      puts "The #{dealer.name} busted. Let's go champ."
    else
      display_winner
    end
  end

  def display_winner
    puts "Ok - the results are in..."
    sleep 5
    player.show_hand
    puts "You ended with a total of #{player.total}"
    puts ""
    sleep 3
    dealer.show_hand
    puts "#{dealer.name} ended with a total of #{dealer.total}"

    if player.total > dealer.total
      puts "You win. Let's go champ"
    elsif player.total < dealer.total
      puts "The #{dealer.name} wins. Better luck next time kid."
    else
      puts "Your scores are the same. It's a tie."
    end
  end

  def clear
    system "clear"
  end

  def display_goodbye_message
    puts "Thank you for playing 21. Good bye."
  end
end

Game.new.start
