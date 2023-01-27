=begin
Define a class of your choice with the following:

Constructor method that initializes 2 instance variables.
Instance method that outputs an interpolated string of those variables.
Getter methods for both (you can use the shorthand notation if you want).
Prevent instances from accessing these methods outside of the class.
Finally, explain what concept(s) you’ve just demonstrated with your code.
=end

class Pokemon
  def initialize(name, move)
    @name = name
    @move = move
  end

  def i_choose_you
    puts "#{name} attacks and uses #{move}!"
  end

  private
  attr_reader :name, :move
end

pikachu = Pokemon.new("Pikachu", "Thunderbolt")
pikachu.i_choose_you

=begin
Concepts demonstrated by code
- When we call the class.new method, this automatically calls the
'#initialize' constructor instance method. 
- We initialize two instance variables in the initialize method. 
- We create a getter method for both instance variables using attr_reader
- We can call that getter method when using string interpolation and 
there is no need to prepend 'self.' for a getter method (only a setter)
- We are unable to access private methods from outside the class. This
is why the call to .i_choose_you flags a NoMethodError. The method is not
available outside the class. 
=end
