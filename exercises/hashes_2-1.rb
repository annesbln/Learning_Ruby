# Now, at the end of the file, add code that prints out the following:

# In German, eins means one, zwei means two, drei means three.
# In Spanish, uno means one, duo means two, tres means three.


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

selected = languages.select do |key, name|
    key == :de or key == :es
end

lines = selected.map do |key, name|
    words = dictionary[key]
    parts = words.map do |key, word|
        "#{key} means #{word}"
    end
    "In #{name}, #{parts.join(", ")}."
end

puts lines


