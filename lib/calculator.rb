require_relative 'oneliner'
require_relative 'stack'

module RPN
  # Determines whether to calculate user input through the OneLiner or Stack classes.
  # 
  class Calculator
    attr_accessor :expression, :operands, :operators, :result

    # Sets operands and operators as empty arrays.
    # 
    def initialize
      @operands = []
      @operators = []  
    end

    # Calculates RPN value depending on type of input. 
    # If input passes one_liner? test, a new OneLiner instance is created and result is returned.
    # If input does not pass one_liner? test, but is valid, a new Stack instance is created and result is returned.
    # 
    def classify(input)
      @expression = input
      if one_liner? == true
        OneLiner.new(self).calculate
      else
        Stack.new(self).calculate
      end

    end

    protected
    # If input matches one_liner?, RPN calculation can be performed on whole line at once.
    # If it doesn't match, the data needs to be calculated through use of the @operands and @operators arrays.
    # 
    def one_liner?
      true if /(\-*\d+\.*\d*) (\-*\d+\.*\d*) (\+|\-|\*|\/)(?!\d)/ =~ @expression 
    end 
  end
end
