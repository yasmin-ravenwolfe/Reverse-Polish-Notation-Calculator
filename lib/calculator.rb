class Calculator
  attr_reader :expression, :operand_first, :operand_second, :operator
  
  # Creates new Calculator instance. 
  # Raises error if expression contains letters.
  # 
  def initialize(expression)
    @expression = expression   
    @saved_results = []
    raise "Invalid line: #{@expression}"  if @expression.match(/[a-zA-z]/)
  end

  # Returns the RPN result when there are no ' ' left.
  # 
  def result     
    if @expression.include?(' ')
    
    calculate

    result
  else
    @saved_results << @expression
    @expression
  end

  end

private
  # Performs the math operation determined by the operator onto the operands.
  # Replaces expression just parsed with result.
  # 
  def calculate
    parse
    result = (@operand_first.to_f).send(@operator,@operand_second.to_f)
    
    @expression.gsub!(@operand_first + ' ' + @operand_second + ' ' + @operator, result.to_s)
  end

  # Parses the expression.
  # Sets matches as two operands and one operator.
  # Accepts negative numbers and decimals.
  # 
  def parse

    line_matcher = /^(\-?\d+\.?\d*) (\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)$/
    next_line_matcher = /^(\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)$/

    # raise "Invalid line: #{@expression}" unless line_matcher =~ @expression 

    if line_matcher =~ @expression
     
      @expression.match(line_matcher)
      @operand_first = $1
      @operand_second = $2
      @operator = $3
    elsif next_line_matcher =~ @expression
      @operand_first = @saved_results.first.to_f
      @operand_second = $1
      @operator = $2
    else
      "not a valid line"
    end

    
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

