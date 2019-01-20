# Make a new file nested_arrays-2.rb, and fill in the following line:
# Fill in the missing line
# So that you get the following output:
# * ** ***
# ** ** **
# *** ** *

numbers = [
  [1, 2, 3],
  [2, 2, 2],
  [3, 2, 1]
]
# your code goes here

lines = numbers.map do |row|
  line = "" # It would better to use map in the following line!
  row.each { |number| line += "*"*number+ " " }
  line
end

lines.each { |line| puts line }

# lines = numbers.collect do |row|
#   row = row.collect { |number| "*" * number }
#   row.join(" ")
# end

# puts lines