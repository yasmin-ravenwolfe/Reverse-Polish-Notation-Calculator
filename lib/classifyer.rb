require_relative 'calculator'

# For each type of input, this class will classify the input.
# After classification, a new instance of the appropriate class will be created.
# The input-based class is responsible for knowing how to do a RPN calculation for that specific input type.
# This class only knows about classifying input types.
# 
# This class acts as a Factory class- it is responsible for creating different types of objects.
# 
module RPN
  class Classifyer
    attr_reader :calculator
    
    def initialize(calculator)
      @calculator = calculator
      
    end

    def classify
      if one_liner? == true
        OneLiner.new(calculator)
      else
        Stack.new(calculator)
      end
    end
    private

    def one_liner?
      true if /(\-*\d+\.*\d*) (\-*\d+\.*\d*) (\+|\-|\*|\/)(?!\d)/ =~ calculator.expression
    end 


  end
end