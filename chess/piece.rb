require_relative "board.rb"
require_relative "cursor.rb"


module Slidable
  SLIDE_MOVES = {
    left: [-1, 0],
    right: [1, 0],
    up: [0, -1],
    down: [0, 1],

    upleft: [-1, -1],
    upright: [1, -1],
    downleft: [-1, 1],
    downright: [1, 1]
  }

  def moves
    moves_arr = []

    self.move_dirs.map do |move| 
      vector_dir = (1..7).map { |i| [SLIDE_MOVES[move][0] * i, SLIDE_MOVES[move][1] * i ] }
      vector_dir.each do |step|
        new_pos = add_to_pos(step)
        moves_arr << new_pos if in_board?(new_pos)
      end
    end

    moves_arr
  end

  def in_board?(pos)
    return false if pos[0] < 0
    return false if pos[0] > 7
    return false if pos[1] < 0
    return false if pos[1] > 7
    true
  end

  def add_to_pos(pos)
    [self.pos, pos].transpose.map(&:sum)
  end
end

module Stepable

end

class Piece
  attr_reader :type, :color, :board, :pos
  def initialize(color, board, pos)
    @type = :R
    @color = color
    @board = board
    @pos = pos
  end

  # def valid_move?(pos)
  #   true
  # end
  
  def inspect
    @type.to_s
  end
  
  def ==(other_type)
    return true if @type == other_type
    false
  end
end

class NullPiece < Piece
  module Singleton; end
  def initialize(board)
    @board = board
    @type = :N
  end
end