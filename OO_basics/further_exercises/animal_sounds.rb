# What does the above code output? How can you fix it so we get the desired results?

class Animal
  @@sound = nil
  
  def initialize(name)
    @name = name
  end
  
  def speak
    puts "#{@name} says #{@sound}"
  end
end

class Dog < Animal
  def initialize(name)
    super
    @sound = 'Woof Woof!'
  end
end

class Cat < Animal
  def initialize(name)
    super
    @sound = 'Meow!'
  end
end
  
fido = Dog.new('Fido')
felix = Cat.new('Felix')

                    # Expected Output:
fido.speak          # => Fido says Woof Woof! 
felix.speak         # => Felix says Meow!