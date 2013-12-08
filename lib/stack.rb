class Stack

  def initialize(calculator)
    @expression = calculator.expression
    @operators = calculator.operators
    @operands = calculator.operands
    
  end


  def add_array
   tokens = @expression.split(' ')

   tokens.each do |token|
      if operand?(token)
        @operands << token
      elsif operator?(token)
        @operators << token
      else
        "not a valid expression"
      end
    end
  end

  def calculate
    add_array
    if @operators.empty?
      @result = @operands.last
    elsif @operands.count >= 2 
      normal_calculation
    else
      @operators.pop
      "Not enough operands for #{@operators} #{@operands} to perform"
    end
  end

  def normal_calculation
    operand_first = @operands.pop
    operand_second = @operands.pop
    operator = @operators.pop
    @result  = (operand_first.to_f).send(operator.to_sym,operand_second.to_f)
      if operator == '-'
        @operands.push(@result * (-1))
      else
        @operands.push(@result)
      end
  end

  def operator?(line)
  true if line =~ /\+|\-|\*|\// 
  # false if line =~ /\d+/
  end

  def operand?(line)
    true if line =~ /(\-?\d+\.?\d*)/ 
  end
end