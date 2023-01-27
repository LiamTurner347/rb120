=begin
class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    self.id = value
  end
end

tom = Student.new("Tom")
tom.id = 45
=end

# # The reason the previous code did not work 
# was that "self.id=" is in fact a method call, which 
# happened to be named exactly the same as the method 
# from where it was being invoked.
# "self.id=(value)" is the same as "id=(value)", 
# which causes a recursive loop and resultant SystemStackError.

class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    @id = value
  end
end

tom = Student.new("Tom")
tom.id = 45
p tom.id