=begin
Write the classes and methods that will be necessary to make this code run, and print the following output:
P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

PEDAC:
  Need a pet class - should have instance variables for animal and name
  Need a owner class - should have:
    instance variables for name and pets [note: should be set to empty array to be populated once adoptions made]
    printout method that prints out as above:
      owner.name has adopted the following pets: 
        iterate through the pets array and for each pet: 
          a pet.animal named pet.name
    number_of_pets method that counts the number of pets in the pets instance variable array and returns that count. 
  Need a shelter class with: 
    adopter instance method set to empty array
    adopt method that takes two arguments (owner, pet_name)
      pet_name should be pushed to the pets instance variable for the relevant owner.
      unless adopter instance method includes the owner, push the owner to the adopted instance variable array.
    print_adoptions method that:
      iterates through each of the adopters in the adopter instance method:
        for each adopter call their printout method
=end

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def output
    "a #{self.animal} named #{self.name}"
  end
end

class Owner
  attr_reader :pets, :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def printout
    puts "#{self.name} has adopted the following pets:"
    self.pets.each do |pet|
      puts pet.output
    end
  end

  def number_of_pets
    self.pets.length
  end
end

class Shelter
  attr_reader :adopters

  def initialize
    @adopters = []
  end

  def adopt(adopter, pet_name)
    adopter.pets << pet_name
    self.adopters << adopter unless self.adopters.include?(adopter)
  end

  def print_adoptions
    self.adopters.each do |adopter|
      adopter.printout
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."