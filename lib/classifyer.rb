require_relative 'calculator'

module RPN
  class Classifyer
    attr_accessor :one_liner, :stack
    def initialize(input)
      @input = input
    end

    def classify
      if one_liner? == true
        @one_liner = OneLiner.new(Calculator.instance)
      else
        @stack = Stack.new(Calculator.instance)
      end
    end

    def one_liner?
      true if /(\-*\d+\.*\d*) (\-*\d+\.*\d*) (\+|\-|\*|\/)(?!\d)/ =~ @expression 
    end 


  end
end