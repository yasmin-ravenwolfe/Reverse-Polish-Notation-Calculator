require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../lib/calculator'

describe Calculator  do 
  let(:calculator) {Calculator.new("1 2 +")
}

  before(:each) do
    Calculator.send(:public, *Calculator.private_instance_methods)
  end
    
  describe ".initialize" do 
    it "creates a new calculate and sets the expression attribute" do

      expect(calculator.expression).to eq("1 2 +") 
    end      
  end

  describe "#result" do 
    it "returns the result of performing calculation" do 

      expect(calculator.result).to eq(3)

    end
  end

  describe "#parse" do
    it "parses the expression and sets operand and operator attributes" do 
      calculator.parse

      expect(calculator.operand_first).to eq('1')
      expect(calculator.operand_second).to eq('2')
      expect(calculator.operator).to eq('+')
    end
  end

end