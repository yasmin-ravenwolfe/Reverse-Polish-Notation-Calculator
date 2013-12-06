require_relative 'calculator'

class CommandLine

  # When a CommandLine instance is created, the run method is immediately called.
  # 
  def initialize
    run
  end

  # Starts program and allows for user input.
  # If user input is 'q', the programs exits.
  # Otherwise, a Calculator instance is called and result is output to console.
  # 
  def run
      input = $stdin.gets.chomp 
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