class Calculator
  attr_accessor :expression, :operands, :operators

  def initialize(expression)
    @expression = expression
    @operands = []
    @operators = []
    put_in_arrays
    
  end

  def put_in_arrays
    tokens = @expression.split
    tokens.each do |token|
      if operator?(token)
        @operators << token
      elsif operand?(token)
        @operands << token
      else
        "not a valid expression"
      end
    end
  end

  def calculate
    @operand_two = @operands.pop
    @operand_one = @operands.pop
    @operator = @operators.shift
    # while @operands.size > 0 && @operators.size > 1


    result = (@operand_one.to_f).send(@operator,@operand_two.to_f)
    # @operands.unshift(result)

    
    result
  end
  end
# # "(1  2) + (3 4) + *"
# 1 2 3 4 
# + + *
# 1 + 2
# 3, 3, 4
# + *
# 3 + 4
# 3, 7 
# *

  def next_calculate

  end

  def operator?(line)
    true if /(\+|-|\*|\/)/ =~ line
    
  end

  def operand?(line)
    true if /(\-?\d+\.?\d*)/ =~ line
  end

end

c = Calculator.new("1 2 + 3 4 +")