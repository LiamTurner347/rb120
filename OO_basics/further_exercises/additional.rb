=begin
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @new_name = @name.upcase
    "My name is #{@new_name}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{self.name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name # => "Sir Gallant"
p sir_gallant.speak

class Person
  def get_name
    @name                     # the @name instance variable is not initialized anywhere
  end
end

bob = Person.new
p bob.get_name 

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                              # => ??

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           # => ??
p Vehicle.wheels                              # => ??

class Car < Vehicle
end

p Car.wheels

module Maintenance
  def change_tires
    "Changing #{self.class::WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
p a_car.change_tires 

module Drivable
  def self.drive
    "is this possible"
  end
end

class Car
  include Drivable
end

p Car.drive

module EmailFormatter
  def email
    "#{first_name}.#{last_name}@#{domain}"
  end
end

module EmailSender
  def email(msg, sender, recipient)
    # contrived implementation for now
    puts "Delivering email to #{recipient} from #{sender} with message: #{msg}"
  end
end

class User
  attr_accessor :first_name, :last_name, :domain
  include EmailSender
  include EmailFormatter
end

u = User.new
u.first_name = "John"
u.last_name = "Smith"
u.domain = "example.com"

p u.email

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new('Sophie')
p kitty.name # "Sophie"
kitty.rename('Chloe')
p kitty.name # "Chloe"

arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
p arr1.object_id == arr2.object_id      # => ??

sym1 = :something
sym2 = :something
p sym1.object_id == sym2.object_id      # => ??

int1 = 5
int2 = 5
p int1.object_id == int2.object_id

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other)
    age > other.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
puts "bob is older than kim" if bob > kim

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    dreamteam = Team.new("Dream Team")
    dreamteam << members + other_team.members
    dreamteam
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
dream_team = cowboys + niners 
p dream_team
=end

class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name # => "Sir Gallant"
p sir_gallant.speak
