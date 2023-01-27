class Bird
  def fly
    p "#{self.class} is flying!"
  end
end

class Pigeon < Bird; end
class Duck < Bird; end

birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)

# What concept does this code demonstrate? What will be the output?

#Polymorphism through class inheritance. Each of the three classes
# is able to respond to the 'Bird#fly' method in a different way