class Sanitizer
  attr_reader :result
  
  def initialize(calculator)
    @expression = calculator.expression
    @operands = calculator.operands
    @operators = calculator.operators
    # one_liner
  end

  def calculate
    return @result unless @expression.include?(' ')
      result
      calculate
  end

   def result
    parse
    @result = (@operand_one.to_f).send(@operator.to_sym,@operand_two.to_f)
    @operands.pop
    @operands.push(@result)
    @expression.gsub!(@operand_one + ' ' + @operand_two + ' ' + @operator, @result.to_s)
  end


  def parse
     line_matcher = /(\-?\d+\.?\d*) (\-?\d+|\d+\.?\d*) (\+|\-|\*|\/)(?!\d)/

      @expression.match(line_matcher)
      @operand_one = $1
      @operand_two = $2
      @operator = $3
  end

end