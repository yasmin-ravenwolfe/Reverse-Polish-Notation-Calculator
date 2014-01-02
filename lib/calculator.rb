require_relative 'oneliner'
require_relative 'stack'
require_relative 'classifyer'
require 'singleton'


module RPN
  # Determines whether to calculate user input through the OneLiner or Stack classes.
  # 
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
