class Person
  def initialize(name, age)
    @surname = name
    @age = age
  end

  @number = 9

  def get_number
    @number
  end

  def name
    @surname
  end

  def age
    @age
  end

  def password=(password)
    @password = password
  end

  def greet (someone)
    name = someone.name
    puts "Hi #{name}! My name is #{self.name}."
  end
end

person = Person.new("Karl", 89)
friend = Person.new("Rolf", 80)

person.greet(friend)

p person.password
p friend