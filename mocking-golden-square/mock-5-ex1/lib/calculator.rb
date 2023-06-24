class Calculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    num1 = @io.gets.chomp
    @io.puts "Please enter another number"
    num2 = @io.gets.chomp
    @io.puts "Here is your result:"
    result = num1.to_i - num2.to_i
    @io.puts "#{num1} - #{num2} = #{result}"

  end

end

# interactive_calculator = Calculator.new(Kernel)
# interactive_calculator.run

# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1