# Using the following code, add a method named 
# share_secret that prints the value of @secret when invoked.

=begin
class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret
=end

class Person
  attr_writer :secret

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.secret # => private method `secret' called for #<Person:0x007fef1986ac08 @secret="Shh.. this is a secret!"> (NoMethodError)

# Expected output: Shh.. this is a secret!