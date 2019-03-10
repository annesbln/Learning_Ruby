numbers = [
  [1, 2, 3],
  [2, 2, 2],
  [3, 2, 1]
]

lines = numbers.map do |row|
  result = ""
  row.map {|number| result += "*" * number + " " }
  result
end

lines.each { |line| puts  line }

# * ** ***
# ** ** **
# *** ** *