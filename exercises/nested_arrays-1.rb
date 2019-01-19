# Make a new file nested_arrays-1.rb, and fill in the missing line
# So that you get the following output: [6, 15, 24]

numbers = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
# your code goes here
sums = numbers.collect do |row|
  row.inject { |sum, number| sum + number }
end
p sums