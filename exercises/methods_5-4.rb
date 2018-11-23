# My complicated version:
def leap_year?(n)
  if n % 4 == 0
    if n % 100 == 0
      if n % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end

def leap_year_easy?(n)
  if n % 4 == 0 and n % 100 != 0 or n % 400 == 0
    true
  else
    false
  end
end
puts "This is my complicated version:"
p leap_year?(2012)
p leap_year?(2015)
p leap_year?(2000)
p leap_year?(1900)

puts "This is the easier solution:"
p leap_year_easy?(2012)
p leap_year_easy?(2015)
p leap_year_easy?(2000)
p leap_year_easy?(1900)