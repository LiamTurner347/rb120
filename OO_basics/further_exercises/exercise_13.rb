VAL = 'Global'

module Foo
  VAL = 'Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

p Foo::Bar.new.value1
p Foo::Bar.new.value2
p Foo::Bar.new.methods

# What will be returned by the value1 and value2 method calls?
