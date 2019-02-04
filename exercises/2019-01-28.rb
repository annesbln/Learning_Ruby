# and is pretty much the same as &&
# or is pretty much the same as ||
# not is pretty much the same as !

# This is a matter of binding! --> look it up

def swowing?
    true
end

def raining?
    false
end

puts "Yay, nice weather!" if not raining?   # this can be used if there is no else condition
puts "Yay, nice weather!" unless raining?
puts "Yay, nice weather!" if not raining?

# You don't need the old school loops like "for" "while" or "until" because ruby has much better features
# like .collect and .map
# Truthiness: only nil and false have the boolean value "false", everything else is true