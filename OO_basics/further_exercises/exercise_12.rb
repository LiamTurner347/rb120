module Walk
  STR = "Walking"
end

module Run
  STR = "Running"
end

module Jump
  STR = "Jumping"
end

class Bunny
  include Jump
  include Walk
  include Run
end

class Bugs < Bunny; end

p Bugs.ancestors
p Bugs::STR

# What will the last two lines of code output?

#Bugs - Bunny - Run - Walk - Jump - Object - Kernel - BasicObject
#Running