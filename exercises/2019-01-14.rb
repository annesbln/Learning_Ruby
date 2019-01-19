names = ["Carla", "Anja", "Maren", "Sabrina", "Michael-Paul"]

# output the sorted list of names on the terminal
# surround the whole thing with a box
# +-------+
# | Carla |
# | Anja  |
# | Maren |
# +-------+
maxName = names.max_by { |name| name.length }
maxLength = maxName.length
names = names.sort

border = "+-" + "-" * maxLength + "-+"

lines = names.collect do |name|
  "| " + name.ljust(maxLength) + " |"
end
lines.unshift(border)
lines.push(border)

puts lines