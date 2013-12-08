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
      Stack.new(self).add_array
      calculate
    end

  end

  def one_liner?
    true if /(\-?\d+\.?\d*) (\-?\d+|\d+\.?\d*) (\+|\-|\*|\/)(?!\d)/ =~ @expression 
  end



  def calculate
    if @operators.empty?
      @result = @operands.last
    else
      if @operands.count >= 2 
      operand_first = @operands.pop
      operand_second = @operands.pop
      operator = @operators.pop

      @result  = (operand_first.to_f).send(operator.to_sym,operand_second.to_f)

      @operands.push(@result)

      else
        "Not enough operators #{@operators} to perform"
      end
    end

  end


end

# c = Calculator.new('5 1 2 + 4 * + 3 -')
# c2 = Calculator.new('-1 0 +')
