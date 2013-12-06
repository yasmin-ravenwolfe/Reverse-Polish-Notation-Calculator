class Calculator
  attr_reader :expression
  
  def initialize(expression)
    @expression = expression
  end

  def result
    return @expression.to_f unless @expression.include?(' ')
    parse

    result
  end

# private
  def parse
    line_matcher = /(\-\d+|\d+\.?\d*) (\-\d+|\d+\.?\d*) (\+|-|\*|\/)(?!\d)/

    raise "Invalid line: #{line}" unless line_matcher =~ @expression
  @match = @expression.match(line_matcher)
  # @operand_first = @match[1]
  # @operand_second = @match[2]
  # @operator = @match[3]
  calculate

  end

  def calculate
    result = (@match[1].to_f).send(@match[3],@match[2].to_f)
    
    @expression.gsub!(@match[1] + ' ' + @match[2] + ' ' + @match[3], result.to_s)
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

