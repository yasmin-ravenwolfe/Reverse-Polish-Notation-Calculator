class Calculator
  def calculate(expression)
  # expression.gsub
  while expression.include?(' ')
  parse(expression)

  calculate(expression)
  end

  expression.to_i

  end

  def parse(line)
      
    line_matcher = /(\-\d+|\d+) (\d+) (\+|-|\*|\/)(?!\d)/


    raise "Invalid line: #{line}" unless line_matcher =~ line

    line.match(line_matcher)
    result = ($1.to_i).send($3,$2.to_i)
    line.gsub!($1 + ' ' + $2 + ' ' + $3, result.to_s)

  end
# calculate('-1 2 +')
# calculate('1 5 1 2 + 4 * + 3 - +
# ')
end

