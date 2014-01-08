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
    attr_reader :expression
    attr_accessor :operands, :operators

    # Sets operands and operators as empty arrays.
    # 
    def initialize
      @operands = []
      @operators = []  
    end

    # Delegates classification of input to passed in classifyer class.
    # Delegates calculation to the classifyer's calculate method.
    def evaluate(classifyer,input)
      @expression = input
      classified_input = classifyer.classify 
      classified_input.calculate
    end

  #   private 
  #   # Creates a new instance of Classifyer class to determine input type.
  #   def classify_input
  #     @classified_input = Classifyer.new.classify
  #   end

  #   # Calls calculate on Classifyer instance, which delegates the actual calculation logic to class that corresponds with input type.
  #   def calculate
  #     @clss.calculate
  #   end
  # end
  end
end
