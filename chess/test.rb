require_relative "display.rb"
require_relative "rook.rb"

d = Display.new(Board.new)
d.board.move_piece([0,0],[1,1])
d.render
