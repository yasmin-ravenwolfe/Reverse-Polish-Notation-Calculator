require_relative 'calculator'
require 'singleton'

module RPN
  class CommandLine
  include Singleton 
    # When a CommandLine instance is created, a new Calculator instance is created.
    # The run method is immediately called.
    # 
    # def initialize
    #   run
    # end

    # Runs program by using user input to do RPN calculations.
    # If user input is 'q', the program exits.
    # Otherwise, Calculator#classify is called and result output to console.
    # 
    def run
      $stderr.print '> '
      input = $stdin.gets.chomp 

      if input == 'q'
        $stdout.puts "goodbye"
        exit false
      else
      raise "Error: #{@input} is not a valid RPN expression" if input =~ /[^\+|\-|\*|\/|(\-*\d+\.*\d*\s)]/ 

      $stdout.puts Calculator.instance.evaluate(input)

      run
      end      
    end
  end
end
