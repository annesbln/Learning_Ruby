# In my very first lesson of the ruby monstas I learned that it is important to write as much code as possible:
# Only via writing code, you actually learn how to code. So this is a small programm to show what I've learned
# within the second three hour session. It is a small guessing game on how to call certain formatting elements...

require 'io/console'

def continue
  puts "Press any key to start."
  STDIN.getch
end

Hash guess_hash = {
  "()" => "(round) parantheses",
  "[]" => "square brackets",
  "{}" => "curly braces"
}

puts "'(Round) parantheses', 'square brackets' or 'curly braces'???"
puts "In this game you will learn it all by <3. Let's play!"

def play(hash)
  continue
  all_keys = hash.keys
  random_key = all_keys[rand(all_keys.size)]
  puts "How do you call these signs: #{random_key}?"
  answer = gets.chomp
  if answer.downcase == hash[random_key].downcase
    puts "Yeah, you are right! Well done :)"
  else
    puts "Sorry, this is wrong. Please try again."
    play(hash)
  end
end

play(guess_hash)
