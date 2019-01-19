# Copy your file to a new file: cp arrays_2-3.rb arrays_2-4.rb, then open this new file.
# Now change your code so that you get the following output:
# ["One <3", "Three <3<3<3", "Five <3<3<3<3<3"]

words = ["one", "two", "three", "four", "five"]
words.each { |word| word.capitalize! }
words = words.map { |word| word + " <3"*(words.index(word) + 1) }
words = words.select { |number| words.index(number).even? }
p words