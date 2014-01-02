require_relative 'oneliner'
require_relative 'stack'
require_relative 'classifyer'
require 'singleton'


module RPN
  # Responsible for storing operand and operators for duration of RPN program.
  # Since there is only one Calculator per opening of the program (because operands and operators need to persist throughout) it is a Singleton class.
  # This class delegates the classification of input type to Classifyer class and RPN calculation to the class for each specific input type (OneLiner or Stack).
  # This class only knows about input (pre-classification) and operands/operators storage (things that persist for the whole program usage). It calls, but delegates everything else.
  class Calculator
    include Singleton
    attr_accessor :expression, :operands, :operators

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
    def evaluate(input)
      @expression = input
      @classifyer = Classifyer.new(@expression).classify.calculate
    end
  end
end
