require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/calculator'
require_relative '../lib/oneliner'

module RPN
  describe Calculator  do 
    let(:calculator) {Calculator.new}

    before(:each) do
      Calculator.send(:public, *Calculator.protected_instance_methods)
    end
      
    describe ".initialize" do 
      it "creates a new calculate and sets the operands and operators attributes to empty arrays" do

        expect(calculator.operands).to eq([]) 
        expect(calculator.operators).to eq([]) 

      end      
    end

    describe "#classify" do 

      context "Calculator#one_liner? is true" do 
        it "creates a new OneLiner instance and returns result of OneLiner#calculate" do
          
          expect(calculator.classify("1 2 +")).to eq(3.0)
        end
      end

      context "Calculator#one_liner? is not true" do
        it "creates a new Stack instance and calls calculate method on it" do     

          expect(calculator.classify("1")).to eq("1")
        end
      end
    end

    describe "#one_liner?" do 
      context "expression matches one-line RPN format" do
        it "returns true" do
          calculator.expression = "1 2 +"

          expect(calculator.one_liner?).to eq(true)
        end
      end

      context "expression does not match one-line RPN format but is valid" do 
        it "return nil" do 

          calculator.expression = "1"
          expect(calculator.one_liner?).to eq(nil)
        end
      end
    end
  end
end
