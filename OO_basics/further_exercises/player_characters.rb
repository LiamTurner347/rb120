# Without running the code, determine what the output will be.

class PlayerCharacter
  attr_reader :name, :hitpoints, :manapoints
  
  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end
end

class Barbarian < PlayerCharacter
  def rage
    true
  end
end

class Summoner < PlayerCharacter
  # all Summoners have 100 manapoints
 
  def initialize(name, hitpoints)
    super(name, hitpoints)
    @manapoints = 100
  end
  
end

conan = Barbarian.new("Conan", 50)
gandolf = Summoner.new("Gandolf", 25) 

p conan.rage # true
p gandolf.manapoints # => 100

p gandolf.hitpoints #25