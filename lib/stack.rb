class Stack

  def initialize(calculator)
    @expression = calculator.expression
    @operators = calculator.operators
    @operands = calculator.operands
    
  end


  def add_array
   tokens = @expression.split(' ')

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

  def operator?(line)
  true if /(\+|\-|\*|\/)/ =~ line 
  end

  def operand?(line)
    true if /(\-?\d+\.?\d*)/ =~ line
  end
end