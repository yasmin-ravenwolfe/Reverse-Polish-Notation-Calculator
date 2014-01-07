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

          expect(classifyer.classify("1 2 +")).to(OneLiner.new(calculator))

        end
      end
    

      context "Classifyer#one_liner is false" do 
        it "creates a new Stack instance" do 
        end
      end
    end


  end
end