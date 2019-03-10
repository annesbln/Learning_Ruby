class Player
  def initialize
      @map = Map.new(0,0)
      @position = [@map.x_coord, @map.y_coord]
      @view = View.new(@position, self)
      @direction = :east
      @view.output
  end

  def position
      @position
  end

  def direction
      @direction
  end

  def sorryWall
      puts "Ouch!!! Sorry, you hit the wall...\n"+
            "Please change the direction."
  end

  def checkWall
      x = @position[0]
      y = @position[1]

      if x < 0
          sorryWall
          @position[0] = x + 1
      elsif x >= @map.width
          sorryWall
          @position[0] = x - 1
      elsif y < 0
          sorryWall
          @position[1] = y + 1
      elsif y >= @map.length
          sorryWall
          @position[1] = y - 1
      else
          @view.output
      end

  end

  def turn_left
      @direction = case @direction
      when :east then :north
      when :north then :west
      when :west then :south
      when :south then :east
      end
      @view.output
  end

  def turn_right
      @direction = case @direction
      when :east then :south
      when :south then :west
      when :west then :north
      when :north then :east
      end
      @view.output
  end

  def move
      x = @position[0]
      y = @position[1]
      case @direction
      when :east then @position = [x + 1, y]
      when :south then @position = [x, y + 1]
      when :west then @position = [x - 1, y]
      when :north then @position = [x, y - 1]
      end
      checkWall
  end
end

class Map
  def initialize(x_coord, y_coord)
      @width = 3
      @length = 3
      @x_coord = x_coord
      @y_coord = y_coord
  end

  def width
      @width
  end

  def length
      @length
  end

  def x_coord
      @x_coord
  end

  def y_coord
      @y_coord
  end
end

class Game
  def initialize
      puts "\nHi, this is 'Mind the wall', the new Game by the famous Ruby Monstas :D\n\n"+
          "Please use the following commands: \n" +
          "'exit'       will end the game.\n" +
          "'turn left'  will change the direction to the left.\n" +
          "'turn right' will change the direction to the right.\n" +
          "'move'       will move you 1 step forward in the direction you chose.\n\n"
      @player = Player.new
      puts "You are now facing: #{@player.direction}."
  end

  def run
      loop do
          case command =  read_command
          when "exit"
              puts "You quit the game. Bye! "
              break
          when "turn left"    then turn_left
          when "turn right"   then turn_right
          when "move"         then move
          else unknown(command)
          end
      end
  end

  def turn_left
      @player.turn_left
  end

  def turn_right
      @player.turn_right
  end

  def move
      @player.move
  end

  def unknown(command)
      puts "I do not know how to respond to: " + command + "."
  end

  def read_command
      gets.chomp
  end
end

class View
  def initialize(position, player)
      @position = position
      @player = player
  end

  def output
      @position = @player.position
      @direction = @player.direction
      border = "+" + "-"*3 + "+ \n"
      result = ""
      result = result + border
      # (0..2).to_a.map
      for y in 0..2
          row = "|"
          for x in 0..2
              if y == @position[1] && x == @position[0]
                  case @direction
                  when :south then row = row + "v"
                  when :north then row = row + "^"
                  when :east then row = row + ">"
                  when :west then row = row + "<"
                  end
              else
                  row = row + " "
              end
          end
          row = row + "|\n"
          result = result + row
      end
      result = result + border
      result = "🦅" + "\033[2J" + result #clear screen before printing
      puts result
  end
end

game = Game.new
game.run