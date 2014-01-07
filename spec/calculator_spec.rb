require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/calculator'
require_relative '../lib/oneliner'

module RPN
  describe Calculator  do 
    let(:calculator) {Calculator.new}
      
    describe ".initialize" do 
      it "creates a new calculate and sets the operands and operators attributes to empty arrays" do

        expect(calculator.operands).to eq([]) 
        expect(calculator.operators).to eq([]) 

      end      
    end

    describe "#evaluate" do 
      it "returns the RPN value" do 

        expect(calculator.evaluate(Classifyer.new(calculator), "1 2 +")).to eq(3)
      end
    end     
  end
end
