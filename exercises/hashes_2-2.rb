# Now, in a new file hashes_2-2.rb, with the same hashes from above, add code that prints out the following table:

# de eins zwei drei
# en one two three
# es uno dos tres

languages = {
  :de => 'German',
  :en => 'English',
  :es => 'Spanish',
}
dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :es => { :one => 'uno', :two => 'dos', :three => 'tres' }
}

lines = dictionary.map do |language, hash|
    parts = hash.map do |key, word|
        "#{word}"
    end
    "#{language} " + parts.join(" ")
end

puts lines

# OFFICIAL SOLUTION
# lines = languages.keys.map do |key|
#     words = dictionary[key].values
#     "#{key} #{words.join(' ')}"
# end
#
# puts lines.join("\n")


