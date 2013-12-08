require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/calculator'
require_relative '../lib/sanitizer'

module RPN 
  describe Sanitizer do
    let(:calculator) {Calculator.new}
    let(:sanitizer) {Sanitizer.new(calculator)}


    before(:each) do
      Sanitizer.send(:public, *Sanitizer.protected_instance_methods)
    end

    describe ".initialize" do
      it "sets expression, operands, and operators values equal to calculator" do

        calculator.expression = "1 2 +"

        expect(sanitizer.expression).to eq("1 2 +")
        expect(sanitizer.operands).to eq([])
        expect(sanitizer.operators).to eq([])
      end
    end

    describe "#calculate" do 
      it "returns the RPN calculated value of the expression" do 
        calculator.expression = "1 2 +"

        expect(sanitizer.calculate).to eq("3.0")
      end
    end

    describe "#result" do 
      it "returns the new expression and pushes reult to operands array" do 
        calculator.expression = "1 2 + 4 -"

        expect(sanitizer.result).to eq("3.0 4 -")
        expect(sanitizer.operands).to eq([3.0])
      end
    end

    describe "#parse" do 
      it "matches expression to regular expression and returns operand_one, operand_two, and operator values" do 

        calculator.expression = "1 2 +"
        
        expect(sanitizer.parse).to eq("+")

      end
    end
  end
end