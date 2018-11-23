numbers = [1, 2, 3, 4, 5, 6]
numbers = [numbers[1], numbers[3], numbers[5]]
p numbers
#This is an alternative solution:
p numbers.select{ |n| n % 2 == 0}
