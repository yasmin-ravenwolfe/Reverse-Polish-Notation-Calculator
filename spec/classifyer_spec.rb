require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/classifyer'
require_relative '../lib/oneliner'
require_relative '../lib/stack'


module RPN
  describe Classifyer  do
    let(:calculator) {Calculator.new}
    let(:classifyer) {Classifyer.new(calculator)}

    before(:each) do
      Classifyer.send(:public, *Classifyer.private_instance_methods)
    end
    describe '.initialize' do
      it "creates a new Classifyer and sets calculator attribute" do
        
        calculator.expression = "1 2 +"
        expect(classifyer.calculator.expression).to eq("1 2 +")
      end
    end

    describe '#classify' do 
      context "Classifyer#one_liner is true" do 
      
        it "create a new OneLiner instance" do 
          calculator.expression = "1 2 +"
          
          expect(classifyer.classify).to be_a(RPN::OneLiner)

        end
      end
    

      context "Classifyer#one_liner is false" do 
        it "creates a new Stack instance" do 
          calculator.expression = "1"

          expect(classifyer.classify).to be_a(RPN::Stack)
        end
      end
    end

    describe "#one_liner" do 
      it "returns true if expression matches regular expression" do 

        calculator.expression = "1 2 +"

        expect(classifyer.one_liner?).to eq(true)
      end
    end

  end
end