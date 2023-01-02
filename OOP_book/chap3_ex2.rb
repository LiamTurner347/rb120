# Override the to_s method to create a user friendly print out of your object.

class MyCar
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "You spray painted the #{self.model} and it is now #{self.color}"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def to_s
    "The car is a #{year} #{model} in #{color}"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina