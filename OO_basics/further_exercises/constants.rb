LOCATION = self

class Parent
  LOCATION = self
end

module A
  module B
    LOCATION = self
    module C
      class Child < Parent
        LOCATION = self
        def where_is_the_constant
          LOCATION
        end
      end
    end
  end
end

instance = A::B::C::Child.new
puts instance.where_is_the_constant

# What does the last line of code output? A::B::C::Child
# Comment out LOCATION in Child, what is output now? A::B 
# Comment out LOCATION in Module B, what is output now? Parent
# Comment out LOCATION in Parent, what is output now? main