=begin
Create a superclass called Vehicle for your MyCar class to inherit 
from and move the behavior that isn't specific to the MyCar class to the superclass. 
Create a constant in your MyCar class that stores information about the 
vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass 
that also has a constant defined that separates it from the MyCar class in some way.
=end

class Vehicle
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

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "The car is a #{year} #{model} in #{color}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "The truck is a #{year} #{model} in #{color}"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
warrior = MyTruck.new(2010, 'mitsubishi warrior', 'black')
puts lumina
puts warrior