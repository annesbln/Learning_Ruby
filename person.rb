class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end

  def password=(password)
    @password = password
  end

  def greet (someone)
    name = someone.name
    puts "Hi #{name}! My name is #{@name}."
  end
end

person = Person.new("Karl", 89)
friend = Person.new("Rolf", 80)

person.greet(friend)