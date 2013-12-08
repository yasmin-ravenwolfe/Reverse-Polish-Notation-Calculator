module RPN
# Calculates the RPN value of an expression that matches one-line RPN format.
# 
  class Sanitizer
    attr_reader :expression, :operands, :operators
    
    # Sets attributes equal to those of the Calculator instance it was created through.
    # 
    def initialize(calculator)
      @expression = calculator.expression
      @operands = calculator.operands
      @operators = calculator.operators
      # one_liner
    end

    # Calculates RPN value until all ' ' have been eliminated.
    # Returns result.
    # 
    def calculate
      return @expression unless @expression.include?(' ')
        result
        calculate
    end

    # Calculates new result by sending operator as a method on operands.
    # Returns the new expression as a string.
    # Pops off last operands value so result replaces it.
    # Pushes result to operands array.
    # 
    def result
      parse
      result = (@operand_one.to_f).send(@operator.to_sym,@operand_two.to_f)
      @operands.pop
      @operands.push(result)
      @expression.gsub!(@operand_one + ' ' + @operand_two + ' ' + @operator, result.to_s)
    end

    # Parses expression to sets operand and operator values.
    # Matches for numbers that are positive or negative and can be a decimal.
    # Matches for +, -, *, / operators.
    def parse
       line_matcher = /(\-?\d+\.?\d*) (\-?\d+|\d+\.?\d*) (\+|\-|\*|\/)(?!\d)/

        @expression.match(line_matcher)
        @operand_one = $1
        @operand_two = $2
        @operator = $3
    end
  end
end