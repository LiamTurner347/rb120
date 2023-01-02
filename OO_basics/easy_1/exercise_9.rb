=begin
Update this code so that when you run it, you see the following output:
My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.
=end

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur_colour)
    super(name, age)
    @fur_colour = fur_colour
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur_colour} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch