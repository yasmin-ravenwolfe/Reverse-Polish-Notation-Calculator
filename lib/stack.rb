module RPN
 
  # Calculates RPN value for multiple lines of user input.
  # This class only knows about specific calculation behavior for the Stack input type.
  # 
  class Stack
  
    attr_reader :expression, :operands, :operators, :operand_first, :operand_second, :operator

    # Sets attributes equal to those of the Calculator instance it was created through.
    # 
    def initialize(calculator)
      @expression = calculator.expression
      @operators = calculator.operators
      @operands = calculator.operands
      
    end

    # Returns RPN calculation result when there are enough operands and operators.
    # Returns last operand when there are no operators.
    # Returns result when there is an operator and at least two operands.
    # Returns an error when there is an operator but less than two operands.
    # 
    def calculate
      add_to_stack
      if operators.empty?
        operands.last
      elsif operands.count >= 2 
        normal_calculation
        operands.last
      else
        operators.pop
        "Not enough operands to perform calculation. (Operands: #{@operands})"
      end
    end

    private

    # Splits expression into an array.
    # Pushes each element into operands or operators array.
    # 
    def add_to_stack
     tokens = expression.split(' ')

     tokens.each do |token|
        if operand?(token)
          operands << token
        elsif operator?(token)
          operators << token
        else
          "Not a valid calculation"
        end
      end
    end


    # Performs arithmetic operation determined by operator.
    # 
    def normal_calculation
      set_values

      if division?
        division
      elsif subtraction?
        subtraction
      elsif addition_and_multiplication?
      addition_and_multiplication
      else
        other_operations
      end
    end

    # Sets operand and operator values for RPN calculation.
    # 
    def set_values
      @operand_first = operands.pop
      @operand_second = operands.pop
      @operator = operators.pop
    end

    # For division operations.
    # 
    def division?
      operator == "/"
    end

    def division
      raise "Cannot divide #{@operand_second} by zero!" if operand_first == "0"
      result = (@operand_second.to_f).send(@operator.to_sym,operand_first.to_f)
      operands.push(result)
    end 

    # For subtraction operations.
    # 
    def subtraction?
      operator == "-"
    end

    def subtraction
      result = (operand_first.to_f).send(operator.to_sym,operand_second.to_f)
      operands.push(result * (-1))
    end

    def addition_and_multiplication?
      operator == "+" || operator == "*"
    end
    # For addition and multiplicaton operations.
    # 
    def addition_and_multiplication
      result = (operand_first.to_f).send(operator.to_sym,operand_second.to_f)
      operands.push(result)
    end

    def other_operations
      result = Math.send(operator.to_sym,operand_first)
    end

    # Returns true is token is an operator.
    # 
    def operator?(token)
      true if token =~ /\+|\-|\*|\/|sin/ 
    end
    # Returns true is token is an operand.
    # 
    def operand?(token)
      true if token =~ /(\-*\d+\.*\d*)/ 
    end
  end
end
