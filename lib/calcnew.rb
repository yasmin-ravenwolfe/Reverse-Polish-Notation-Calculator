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
    while @operands.size > 0 && @operators.size > 1
    @operand_two = @operands.pop
    @operand_one = @operands.pop
    @operator = @operators.pop

    result = (@operand_one.to_f).send(@operator,@operand_two.to_f)
    @operands << result
    calculate
  end
  result
  
  end

  def next_calculate
    
  end

  def operator?(line)
    true if /(\+|-|\*|\/)/ =~ line
    
  end

  def operand?(line)
    true if /(\-?\d+\.?\d*)/ =~ line
  end

end