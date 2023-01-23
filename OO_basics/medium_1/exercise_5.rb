=begin
class InvalidTokenError < StandardError; end
class EmptyStackError < StandardError; end

class Minilang
  attr_accessor :commands, :stack, :register

  def initialize(command)
    @commands = command.split
    @stack = []
    @register = 0
  end

  def eval
    @commands.each do |command|
      if command.to_i.to_s == command
        integer(command.to_i)
      elsif command == "PUSH"
        push
      elsif command == "ADD"
        add
      elsif command == "SUB"
        subtract
      elsif command == "MULT"
        multiply
      elsif command == "DIV"
        divide
      elsif command == "MOD"
        modulo
      elsif command == "POP"
        pop 
      elsif command == "PRINT"
        print_reg
      else
        raise InvalidTokenError, "Invalid token: #{command}"
      end
    end
  end

  def integer(num)
    self.register = num
  end

  def push
    stack.push(register)
  end

  def add
    if stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      self.register += stack.pop
    end
  end

  def subtract
    if stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      self.register -= stack.pop
    end
  end

  def multiply
    if stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      self.register *= stack.pop
    end
  end

  def divide
    if stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      self.register /= stack.pop
    end
  end

  def modulo
    if stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      self.register %= stack.pop
    end
  end

  def pop
    if stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      self.register = stack.pop
    end
  end

  def print_reg
    puts register
  end
end
=end

require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @stack = []
    @register = 0
    @program.split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end$

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

=begin
Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!
=end

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

=begin
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB
=end

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
