# Add a class method to your MyCar class that calculates the gas mileage of any car.

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
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
MyCar.gas_mileage(13, 351)