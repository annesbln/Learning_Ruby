=begin
In my very first lesson of the ruby monstas I learned that it is important to write as much code as possible:
Only via writing code, you actually learn how to code. So this is a small programm to show what we've learned
within the first three hour session...
=end
require 'io/console'

puts "This is what I have learned in the first Ruby Monstas session:"
learned_facts=[
  "Learning to programm is like learning how to ride a bicycle. You learn only by doing it (a lot).",
  "Conventions are important because of image recognition. Never use tabs ever again! Two Spaces. Period!",
  "In Ruby you should always enter spaces before and after operators.",
  "You should configure your text editor and your terminal. Do it now!",
  "As a programmer you will always use the terminal, so learn unix commands now!",
  "NO ONE! EVER! uses Windows commands!",
  "Get used to tab completion. It is extremely helpful.",
  "A terminal is an environment for text input and output. A shell is a command line interpreter and can be run in a terminal.",
  "You can say, that SQL is also a shell.",
  "There was much more stuff I learned but this is the end of the array..."
]

puts "Please enter how many facts you want to display (0 - #{learned_facts.length}):"
number = gets.chomp
$count = 0

def continue
  puts "Press any key to continue."
  STDIN.getch
end

begin
  puts "#{$count+1}: "+ learned_facts[$count]
  puts ""
  continue()
  $count += 1
end until $count == number.to_i
