require_relative 'calculator'

class CommandLine

  def initialize
    prompt_user
  end

  def prompt_user
    input = $stdin.gets.chomp     
    if input == 'q'
      puts "goodbye"
      exit false
    else
    calculator = Calculator.new(input)

    puts calculator.result
    prompt_user
  end
  end

end