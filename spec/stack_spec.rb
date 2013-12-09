require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/calculator'
require_relative '../lib/stack'

module RPN 
  describe Stack do
    let(:calculator) {Calculator.new}
    let(:stack) {Stack.new(calculator)}
    
    before(:each) do
      Stack.send(:public, *Stack.protected_instance_methods)
    end

    describe ".initialize" do 
      it "sets expression, operands, and operators values equal to calculator" do 
        calculator.expression = "1"

        expect(stack.expression).to eq("1")
        expect(stack.operands).to eq([])
        expect(stack.operators).to eq([])
      end
    end

    describe "#add_to_stack" do
      it "splits expression into an array and pushes each element into operands or operators array" do 
        calculator.expression = "1 +"
        stack.add_to_stack

        expect(stack.operators).to eq(["+"])
        expect(stack.operands).to eq(["1"])
      end     
    end

    describe "#calculate" do 
      context "operators array is empty" do 
        it "returns the previous operand" do 
          calculator.expression = "1 2"

          expect(stack.calculate).to eq("2")
        end
      end

      context "there are two or more elements in operands array" do 
        it "executes normal_calculation method and returns RPN calculation result" do 
          calculator.expression = "1 2 +"

          expect(stack.calculate).to eq(3.0)
        end
      end

      context "there are less than two elements in operands array" do 
        it "returns error message" do 
          calculator.expression = "+"

          expect(stack.calculate).to eq("Not enough operands to perform calculation. (Operands: [])")
        end
      end
    end

    describe "#normal_calculation" do 

      context "operation is division" do 
        it "calculates RPN result and pushes into operands array" do 
          calculator.expression = "1 2 /"
          stack.add_to_stack
          stack.normal_calculation

          expect(stack.operands.last).to eq(0.5)
        end
      end

      context "operation is subtraction" do 
        it "calculates RPN result and pushes into operands array" do 
          calculator.expression = "1 2 -"
          stack.add_to_stack
          stack.normal_calculation

          expect(stack.operands.last).to eq(-1)
        end
      end

       context "operation is addition or multiplicaton" do 
        it "calculates RPN result and pushes into operands array" do 
          calculator.expression = "1 2 *"
          stack.add_to_stack
          stack.normal_calculation

          expect(stack.operands.last).to eq(2)
        end
      end
    end

    describe "#set_values" do 
      it "sets operand and operator values" do 
        calculator.expression = "1 2 +"
        stack.add_to_stack
        stack.set_values

        expect(stack.operand_first).to eq("2")
        expect(stack.operand_second).to eq("1")
        expect(stack.operator).to eq("+")
      end
    end

    describe "#divison?" do 
      it "returns true if the operation is division" do 
        calculator.expression = "1 2 /"
        stack.add_to_stack
        stack.set_values

        expect(stack.division?).to eq(true)
      end
    end

    describe "#division" do 
      it "calculates the RPN value for a division operation" do 

        calculator.expression = "1 2 /"
        stack.add_to_stack
        stack.set_values
        

        expect(stack.division).to eq([0.5])

      end
    end

    describe "#subtraction?" do 
      it "returns true if the operation is subtraction" do 
        calculator.expression = "1 2 -"
        stack.add_to_stack
        stack.set_values

        expect(stack.subtraction?).to eq(true)
      end
    end
    describe "#subtraction" do 
      it "calculates the RPN value for a subtraction operation" do 

        calculator.expression = "1 2 -"
        stack.add_to_stack
        stack.set_values
        
        expect(stack.subtraction).to eq([-1.0])
      end
    end

    describe "#addition_and_multiplication" do 
      it "calculates the RPN value for addition and multiplication operations" do 

        calculator.expression = "1 2 +"
        stack.add_to_stack
        stack.set_values
        
        expect(stack.addition_and_multiplication).to eq([3.0])
      end
    end

    describe "#operator?" do 
      it "returns true if token is an operator" do 

        expect(stack.operator?("+")).to eq(true)
      end
    end

    describe "#operand?" do 
      it "returns true if token is an operand" do 

        expect(stack.operand?("-1")).to eq(true)
      end
    end
  end
end
