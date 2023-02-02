# Modify the given code to achieve the expected output

class FishAliens
  def initialize(age, name)
    @age = age
    @name = name
  end

  def ==(other)
    name == other.name
  end
  
  protected

  attr_reader :age, :name
end

class Jellyfish < FishAliens; end

class OctoAlien < FishAliens; end

fish = Jellyfish.new(100, "Fish")
alien = OctoAlien.new(75, "Roger")

                      # Expected output:
p fish == alien       # => false