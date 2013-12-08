require_relative 'calculator'

class CommandLine

  # When a CommandLine instance is created, the run method is immediately called.
  # 
  def initialize(expression, options = {})
    @expression = $stdin.gets.chomp 
    run
  end

  # Starts program and allows for user input.
  # If user input is 'q', the programs exits.
  # Otherwise, a Calculator instance is called and result is output to console.
  # 
  def run
      if @expression == "q"
        $stdout.puts "goodbye"
        exit false
      
      else
      calculator = Calculator.new(@expression)
      $stdout.puts calculator.first_step
      # $stdout.puts calculator.result
      
      
    end
  end
end