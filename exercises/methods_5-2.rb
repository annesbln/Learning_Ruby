greetings = ["Hello", "Hi", "Ohai", "ZOMG"]

def greet(array, name)
  "#{array[rand(array.size)]} #{name}!"
end

puts greet(greetings, "Anne")
