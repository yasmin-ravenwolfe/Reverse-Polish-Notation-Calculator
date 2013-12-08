# require 'pry'
require_relative 'stack'
require_relative 'sanitizer'

class Calculator
  attr_accessor :expression, :operands, :operators, :result

  def initialize
    @operands = []
    @operators = []
    
  end


  def first_step(input)
    @expression = input
    if one_liner? == true
      Sanitizer.new(self).calculate
    else
      Stack.new(self).calculate
      # calculate
    end

  end

  def one_liner?
    true if /(\-?\d+\.?\d*) (\-?\d+|\d+\.?\d*) (\+|\-|\*|\/)(?!\d)/ =~ @expression 
  end 

end

# c = Calculator.new('5 1 2 + 4 * + 3 -')
# c2 = Calculator.new('-1 0 +')
