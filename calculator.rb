class Calculator
  def plus (x , y)
    x + y
  end

  def minus (x , y)
    x - y
  end

  def multiply (x, y)
    x * y
  end

  def divide (x, y)
    x.to_f / y.to_f
  end
end

calculator = Calculator.new()

puts calculator.plus(2, 3)
puts calculator.minus(2, 3)
puts calculator.multiply(2, 3)
puts calculator.divide(2, 3)
