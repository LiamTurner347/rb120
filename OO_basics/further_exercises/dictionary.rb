# Implement the following classes such that we get the desired output

class Dictionary
  attr_reader :words

  def initialize
    @words = []
  end

  def <<(word)
    words.push(word)
    words.sort!
  end

  def by_letter(letter)
    select_words = words.select do |word|
      word.name.start_with?(letter.upcase)
    end

    puts select_words
  end
end

class Word
  include Comparable

  attr_reader :name, :definition

  def initialize(name, definition)
    @name = name
    @definition = definition
  end

  def to_s
    "#{name}"
  end

  def <=>(other)
    name <=> other.name
  end
end

apple = Word.new("Apple", "The round fruit of a tree of the rose family")
banana = Word.new("Banana", "A long curved fruit which grows in clusters and has soft pulpy flesh and yellow skin when ripe")
blueberry = Word.new("Blueberry", "The small sweet blue-black edible berry of the blueberry plant")
cherry = Word.new("Cherry", "A small, round stone fruit that is typically bright or dark red")

dictionary = Dictionary.new

dictionary << apple
dictionary << banana
dictionary << cherry
dictionary << blueberry

puts dictionary.words
# Apple
# Banana
# Blueberry
# Cherry

puts dictionary.by_letter("a")
# Apple

puts dictionary.by_letter("B")
# Banana
# Blueberry