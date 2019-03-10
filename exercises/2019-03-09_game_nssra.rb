# Map
#
# * be able to place things on the map
# * be able to draw the map
#
# Things:
#
# * Wall
# * Door
# * People

class Map
    def initialize(width, length)
      @data = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil],
      ]
      @width = width
    end
  
    def data
      @data
    end
  
    def width
      @width
    end
  
    def place(x, y, object)
      @data[x][y] = object
    end
  end
  
  class Person
    def initialize(name)
      @name = name
    end
  end
  
  class Eagle
  end
  
  class Wall
  end
  
  class View
    def initialize(map)
      @map = map
    end
  
    def draw
      [border] + lines + [border]
    end
  
    def border
      '+' + ('-' * @map.width) + '+'
    end
  
    def lines
      @map.data.collect do |row|
        "|" + fields(row).join + "|"
      end
    end
  
    def fields(row)
      row.collect do |object|
        case object
        when Eagle then "🦅"
        when nil    then " "
        when Person then "☺"
        when Wall   then "█"
        else fail("Unknown object #{object.inspect}")
        end
      end
    end
  end
  
  
  carla = Person.new("Carla")
  
  map = Map.new(3, 3)
  map.place(1, 1, carla)
  
  
  0.upto(2) do |y|
    map.place(0, y, Wall.new)
  end
  #
  x = rand(map.data.length).to_i
  y = rand(map.data.length).to_i
  map.place(x,y, Eagle.new)
   p x
   p y
  p map
  
  
  
  view = View.new(map)
  puts view.draw