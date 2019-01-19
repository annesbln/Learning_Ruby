# Create a new, empty file. Save it as arrays_2-1.rb. 
# Write the missising line of code so that you get
# the following output: ["one", "three", "five"]

words = ["one", "two", "three", "four", "five"]
  # my own solution:
  words = words.select { |number| words.index(number).even? }
  # more elegant solution: words = words.select.with_index { |number, i| i.even? }
p words