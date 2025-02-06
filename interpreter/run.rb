# frozen_string_literal: true

class Two
  def evaluate
    2
  end
end

class Three
  def evaluate
    3
  end
end

class Add
  attr_reader :number_one, :number_two

  def initialize(number_one, number_two)
    @number_one = number_one
    @number_two = number_two
  end

  def evaluate
    number_one.evaluate + number_two.evaluate
  end
end

class Substract
  attr_reader :number_one, :number_two

  def initialize(number_one, number_two)
    @number_one = number_one
    @number_two = number_two
  end

  def evaluate
    number_one.evaluate - number_two.evaluate
  end
end

class Parser
  attr_reader :tokens

  def initialize(text)
    @tokens = text.split
  end

  def next_token
    @tokens.shift
  end

  def expression
    token = next_token

    case token
    when 'add'
      Add.new(expression, expression)
    when 'substract'
      Substract.new(expression, expression)
    when 'three'
      Three.new
    when 'two'
      Two.new
    else
      expression
    end
  end
end

parser = Parser.new 'add three to two'

# At first it split text into tokens
parser.tokens = %w[add three to two]

ast = parser.expression
# It runs expression, first token is 'add', so it create Add.new
# First argument of Add.new run expression once again
# Now token is three, so it returns Three.new as a first argument
# In the next run of exppression it can't find anything so ignore the "to" token and run expression once again
# Now it's the same thing as the second argument, so it returns two
# This is how it looks at the end: Add.new(Three.new, Two.new)
ast.evaluate # => 5

class Calculator
  def calc(text)
    parser = Parser.new(text)
    ast = parser.expression
    ast.evaluate
  end
end

calculator = Calculator.new
calculator.calc('add three to two') # => 5
calculator.calc('add three to three') # => 6
