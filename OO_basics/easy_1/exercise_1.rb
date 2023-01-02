# Complete this class so that the test cases shown below work as intended. 
# You are free to add any methods or instance variables you need. 
# However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

class Banner
  def initialize(message, length=(message.length))
    @message = message
    @length = length
  end

  def to_s
    if length_valid?
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    else 
      error_message
    end
  end

  private

  def horizontal_rule
    "+-#{"-" * @length}-+"
  end

  def empty_line
    "| #{" " * @length} |"
  end

  def message_line
    "| #{@message.center(@length)} |"
  end

  def length_valid?
    if @length < @message.length || @length > 100
      false
    else
      true
    end
  end

  def error_message
    if @length < @message.length
      puts "The length you have provided is not long enough. The banner must be wider than the words in the banner."
    else
      puts "The length is too long. It must be less than 100 characters"
    end
  end
end

# Test case 1:
banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

# Test case 2: 
banner = Banner.new('')
puts banner
=begin
+--+
|  |
|  |
|  |
+--+
=end

# Check the length provided
# If it is less than the message length, error
# If it is greater than 100, error
# Else, true