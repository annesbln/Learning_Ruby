numbers = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

def sum(row)
  result = 0 
  row.map { |number| result += number }
  result
end

sums = numbers.map do |row|
  sum(row)
end

p sums

# [6, 15, 24]
