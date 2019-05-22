require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  attr_reader :cursor, :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([3,3], @board)
  end

  def render
    system("clear")
    (0..7).each do |y|
      (0..7).each do |x|
        char = board[[x, y]].type.to_s
        if char == "N"
          print " ".colorize(:background => get_background_color([x, y]))
          print " ".colorize(:background => get_background_color([x, y]))
        else
          print char.colorize(:color => :black, :background => get_background_color([x, y]))
          print " ".colorize(:background => get_background_color([x, y]))
        end
      end
      puts
    end
  end

  def get_background_color(pos)
    return :blue if pos == cursor.cursor_pos
    return :light_black if (pos[0] + pos[1]) % 2 == 0 
    :light_white
  end
end