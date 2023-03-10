=begin
As long as the user doesn't quit, keep track of a history of moves 
by both the human and computer. 
What data structure will you reach for? 
Will you use a new class, or an existing class? 
What will the display output look like?

class Move
  VALUES = ["rock", "paper", "scissors", "lizard", "spock"]
  attr_accessor :history

  def initialize(value)
    @value = value
    @history = []
  end

  def scissors?
    @value == "scissors"
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end
  
  def lizard?
    @value == "lizard"
  end

  def spock?
    @value == "spock"
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.spock? || other_move.paper?)) ||
      (spock? && (other_move.scissors? || other_move.rock?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.rock? || other_move.scissors?)) ||
      (spock? && (other_move.lizard? || other_move.paper?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    tempname = nil
    loop do
      puts "What's your name?"
      tempname = gets.chomp
      break unless tempname.empty?
      puts "Sorry, must enter a value."
    end
    self.name = tempname
  end

  def choose
    choice = nil
    loop do
      puts "Please choose: rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "C3P0"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    @history << [@human.move, self.move]
  end
end

# Game orchestration engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock! First to three wins."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
  
  def increment_score
    human.score += 1 if human.move > computer.move
    computer.score += 1 if human.move < computer.move
    display_score
  end
  
  def display_score
    puts "#{human.name}: #{human.score} - #{computer.name} #{computer.score}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ["y", "n"].include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == "y"
  end

  def score_limit?
    human.score == 3 || computer.score == 3
  end

  def display_move_history
    puts "The game went as follows:"
    @history.each_with_index do |moves, index|
      puts "In round #{index + 1}, #{human.name} chose #{moves[0]} and #{computer.name} chose #{moves[1]}"
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      increment_score
      break if score_limit?
      break unless play_again?
    end
    display_move_history
    display_goodbye_message
  end
end

RPSGame.new.play
=end