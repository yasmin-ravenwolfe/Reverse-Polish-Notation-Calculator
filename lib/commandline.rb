require_relative 'calculator'

class CommandLine

  # When a CommandLine instance is created, the run method is immediately called.
  # 
  def initialize(input)
    @input = $stdin.gets.chomp 
    @calculator = Calculator.new(@input)
    run
  end

  # Starts program and allows for user input.
  # If user input is 'q', the programs exits.
  # Otherwise, a Calculator instance is called and result is output to console.
  # 
  def run
    # input = $stdin.gets.chomp 
      if @input == "q"
        $stdout.puts "goodbye"
        exit false
      
      else
      $stdout.puts @calculator.first_step

      until @input == 'q'
      # calculator = Calculator.new(input)
      input = $stdin.gets.chomp 
      $stdout.puts @calculator.next_step(input)

end
      # $stdout.puts calculator.result
      
      
    end
  end


end