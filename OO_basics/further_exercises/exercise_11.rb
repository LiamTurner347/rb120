class Cat
  attr_accessor :name

  def set_name
    self.name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
p cat.name

# What would cat.name return after the last line of code is executed?

#nil
