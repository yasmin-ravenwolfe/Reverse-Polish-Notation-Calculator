require_relative 'calculator'

class CommandLine

  def initialize(input)
    if ARGV == []
        puts "Nothing to calculate!"
        exit false
      end 
     calculator = Calculator.new(input)

     puts calculator.calculate
  end
end