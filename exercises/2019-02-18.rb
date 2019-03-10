# numbers = ["one", "two", "three"]

# def emphazise(numbers)
#   numbers.map do |number|
#     "#{number}!"
#   end
# end

# puts emphazise(numbers)

# messages = {
#   :not_found => "File not found",
#   :no_memory => "Out of memory"
# }

# message = messages[:not_found]

# puts message

# The ruby toolbox --> for discovering gems

# require "csv"

# p CSV

source 'https://rubygems.org'

gem 'parslet'

group :test do
  gem 'rspec'
end