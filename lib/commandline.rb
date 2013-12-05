require_relative 'calculator'

class CommandLine

  def initialize(expression)
    # if ARGV.length == 0 || ARGV.is_a?(String) == false
    #     puts "Usage: #{ARGV[0]} [length]"
    #     exit false
    #   end 
    e = expression.join
     calculator = Calculator.new

     puts calculator.calculate(e)
  end
end