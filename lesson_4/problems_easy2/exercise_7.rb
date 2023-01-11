class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

mufflymcmuffle = Cat.new("siamese")
p Cat.cats_count
winkles = Cat.new("tabby")
p Cat.cats_count