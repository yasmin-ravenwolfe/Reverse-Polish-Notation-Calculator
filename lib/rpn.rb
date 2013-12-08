module ReversePolishNotationCalculator
  def self.calc(expression)
    Calculator.new.first_step(expression)
end