# Print to the screen your method lookup for the classes that you have created.

module Tuggable
  def tuggable
    "This vehicle is tuggable"
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
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
  include Tuggable
  NUMBER_OF_DOORS = 2

  def to_s
    "The truck is a #{year} #{model} in #{color}"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
warrior = MyTruck.new(2010, 'mitsubishi warrior', 'black')
puts "--Method lookup path for Vehicle--"
puts Vehicle.ancestors
puts "--Method lookup path for MyCar--"
puts MyCar.ancestors
puts "--Method lookup path for MyTruck--"
puts MyTruck.ancestors