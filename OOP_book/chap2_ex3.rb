=begin
You want to create a nice interface that allows you to accurately 
describe the action you want your program to perform. 
Create a method called spray_paint that can be called on an object 
and will modify the color of the car.
=end

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
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed
puts lumina.color
lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint("red")