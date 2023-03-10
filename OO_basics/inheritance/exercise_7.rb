# Using the following code, determine the lookup path used when invoking cat1.color. 
# Only list the classes that were checked by Ruby when searching for the #color method.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
p cat1.color
p Cat.ancestors

# MLP: Cat > Animal (color method found here and stopped) > Object > Kernel > BasicObject