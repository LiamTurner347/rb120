class Vehicle; end

WHEELS = 6

class Car < Vehicle
  WHEELS = 2
  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 2