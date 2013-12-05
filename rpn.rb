def eval
while str.include('')

end

def calculate(line)
return line.to_i unless line.include?(' ')
line_matcher = /(\-\d+|\d+) (\d+) (\+|-|\*|\/)(?!\d)/
line.match(line_matcher)
result = ($1.to_i).send($3,$2.to_i)

line.gsub!($1 + ' ' + $2 + ' ' + $3, result.to_s)

calculate(line)
end




# result = ($1.to_i).send($3,$2.to_i)


# /^(\-\d+|\d+) (\d+) (\+|-|\*|\/) (.+)$/

# def parse(line)
 
# line_matcher = /^(\-\d+|\d+) (\d+) (\+|-|\*|\/) (.*)$/
# matches = line_matcher.match(line)
# # operand_first = matches[1].to_i
# operand_first = $1.to_i

# operand_second = $2.to_i
# operator = $3
# next_string = $4
# result = operand_first.send(operator, operand_second)

# parse($4)
# operand_first = result
# operand_second = $2.to_i
# operator = $3

# result = result = operand_first.send(operator, operand_second)


# return result
# end

def calculate(line)

while line.include?(' ')
line_matcher = /(-?\d+) (-?\d+) (\+|-|\*|\/)(?!\d)/
line.match(line_matcher)
result = ($1.to_i).send($3,$2.to_i)

line.gsub!($1 + ' ' + $2 + ' ' + $3, result.to_s)

calculate(line)
end

line.to_i

end

def parse(line)
  
  end


