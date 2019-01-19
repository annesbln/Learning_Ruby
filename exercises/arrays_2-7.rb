# Copy your file to a new file: cp arrays_2-6.rb arrays_2-7.rb, then open this new file.
# Now change your code so that you get the following output, aligning the second column
# One   <3
# Three <3<3<3
# Five  <3<3<3<3<3

words = ["one", "two", "three", "four", "five"]
words.each { |word| word.capitalize! }
words = words.map { |word| word + " "*(6-word.length()) +"<3"*(words.index(word) + 1) }
words = words.select { |number| words.index(number).even? }
puts words.join("\n")