class Calculator
  attr_accessor :expression, :operands, :operators, :result

  def initialize(expression)
    @expression = expression
    @operands = []
    @operators = []

    first_step
    
  end

  def first_step
    if one_liner? == true
      one_liner
    else
      add_array
      calculate
    end
    return @result
  end

  def more_input
    first_step

  end

  def one_liner?
    true if /(\-?\d+\.?\d*) (\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)/ =~ @expression 
  end

  def one_liner
    while @expression.include?(' ')
      calculate_one_liner
      first_step
    end

  end

  def calculate_one_liner
    parse
    @result = (@operand_one.to_f).send(@operator,@operand_two.to_f)
    @operands.push(@result)
    @expression.gsub!(@operand_one + ' ' + @operand_two + ' ' + @operator, result.to_s)
  end



  def parse
     line_matcher = /(\-?\d+\.?\d*) (\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)/

      @expression.match(line_matcher)
      @operand_one = $1
      @operand_two = $2
      @operator = $3
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

  def calculate
    if @operators.empty?
      return @operands.last
    else
      if @operands.count >= 2
      operand_first = @operands.pop
      operand_second = @operands.pop
      operator = @operator.pop

      @result  = (operand_first.to_f).send(operator,operand_second.to_f)

      @operands.push(@result)
      return @result

      else
        "Not enough operators #{@operators} to perform"
      end
    end

  end

def operator?(line)
    true if /(\+|-|\*|\/)/ =~ line
    
  end

  def operand?(line)
    true if /(\-?\d+\.?\d*)/ =~ line
  end
end

c = Calculator.new('5 1 2 + 4 * + 3 -')