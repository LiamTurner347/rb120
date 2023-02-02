module Attackable
  def attacks
    puts "attacks!"
  end
end

class Barbarian
  include Attackable

  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end
end

class Monster
  include Attackable

  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end
end


conan = Barbarian.new("Conan", 50)
zombie = Monster.new("Fred", 100)

conan.attacks
zombie.attacks

# We expected the code to output
#=> "attacks!"
#=> "attacks!"

#=> Instead we raise an error.  What would be the best way to fix this implementation? Why?
#= I would make one of the classes inherit from the other so as to try and prevent repeating ourself (DRY)
# An alternative solution would be to store the attacks method in a separate module and mix it in to both
# the Barbarian and Monster class. 
