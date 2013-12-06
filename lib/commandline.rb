require_relative 'calculator'

class CommandLine
  attr_reader :input

  def initialize
    run
  end

  def run
    # input = $stdin.gets.chomp 
    @input = 'q'    
      if input == "q"
        $stdout.puts "goodbye"
        exit false
      else
      calculator = Calculator.new(input)

      $stdout.puts calculator.result
      run
    end
  end

end