# Copy your file to a new file: cp arrays_2-2.rb arrays_2-3.rb, then open this new file.
# Now change your code so that you get the following output:
# ["One <3", "Three <3", "Five <3"]
# Use string interpolation for this.

words = ["one", "two", "three", "four", "five"]
  # my own solution:
  words = words.select { |number| words.index(number).even? }
  # more elegant solution: words = words.select.with_index { |number, i| i.even? }
  # my own solution:
  words.each { |word| word.capitalize! }
  words = words.map { |word| "#{word} <3" }
  # official solution: words = words.map { |word| word.capitalize }
p words