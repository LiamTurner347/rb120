# What is a module? What is its purpose? How do we use them with our classes? 
# Create a module for the class you created in exercise 1 and include it properly.

module PlayerSkill
  def pep_talk(words)
    puts words
  end
end

class JurgenKloppLiverpool
  include PlayerSkill
end

sadio_mane = JurgenKloppLiverpool.new
sadio_mane.pep_talk("allez les gars")