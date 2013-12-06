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
    it "returns "
  end

end