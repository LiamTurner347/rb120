# Fix the following code so it works properly:

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    @mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new # at this point mileage is set to 0 by initialize
car.mileage = 5000 # we have a setter method due to attr_accessor, so mileage now set to 5000
car.increment_mileage(678) # this method fails to increment @mileage as we use 'mileage' rather than the @mileage
#instance variable. Ruby assumes this is a new local variable. 
car.print_mileage  # should print 5678