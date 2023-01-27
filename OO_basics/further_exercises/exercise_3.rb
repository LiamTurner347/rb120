module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"

=begin
Concepts:
- Use of mixin modules via the include keyword (interface inheritance) 
- Method lookup path - neither Teacher nor Student class have a greet method.
However, because they both 'include' the Greet module, we can look up the
nethod lookup path
=end
