require_relative 'calculator'
require_relative 'classifyer'
require 'singleton'

module RPN
  class CommandLine
  attr_reader :calculator
  attr_accessor :classified_input
  include Singleton 
    # When a CommandLine instance is created, a new Calculator instance is created.
    # The run method is immediately called.
    # 
    def initialize
      @classified_input = nil
    end

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

      @classified_input = Classifyer.new(input).classify
      $stdout.puts @classified_input.calculate
      # Calculator.instance.evaluate(@classified_input)

      run
      end      
    end
  end
end
