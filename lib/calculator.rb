class Calculator
  attr_reader :expression, :operand_first, :operand_second, :operator
  
  def initialize(expression)
    @expression = expression
  end

  def result
    return @expression.to_f unless @expression.include?(' ')
    
    parse
    
    calculate

    result
  end

# private
  def parse
    line_matcher = /(\-\d+|\d+\.?\d*) (\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)/

    raise "Invalid line: #{line}" unless line_matcher =~ @expression
    
    @expression.match(line_matcher)
    @operand_first = $1
    @operand_second = $2
    @operator = $3
  end

  def calculate
    result = (@operand_first.to_f).send(@operator,@operand_second.to_f)
    
    @expression.gsub!(@operand_first + ' ' + @operand_second + ' ' + @operator, result.to_s)
  end
end




# class Calculator
  
#   def initialize(expression)
#     @expression = expression
#   end

#   def calculate
#     return @expression.to_f unless @expression.include?(' ')
#     parse(@expression)

#     calculate
#   end

# private
#   def parse(line)
      
#     line_matcher = /(\-\d+|\d+\.?\d*) (\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)/

#     raise "Invalid line: #{line}" unless line_matcher =~ line

#     line.match(line_matcher)
#     result = ($1.to_f).send($3,$2.to_f)
#     line.gsub!($1 + ' ' + $2 + ' ' + $3, result.to_s)

#   end
# end

