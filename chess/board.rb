
require_relative "piece.rb"
require_relative "rook.rb"


class Board

  attr_reader :rows
  def initialize
    @sentinel = NullPiece.new(self)
    @rows = Array.new(8) { Array.new(8, @sentinel) }
    self[[0,0]] = Rook.new(:white, self, [0,0])
    self[[1,0]] = Rook.new(:white, self, [1,0])
    self[[3,0]] = Rook.new(:white, self, [3,0])
    self[[6,0]] = Rook.new(:white, self, [6,0])
    self[[7,0]] = Rook.new(:white, self, [7,0])
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @rows[pos[0]][pos[1]] = value
  end
  

  def move_piece(start_pos, end_pos)
    raise NoPieceError if self[start_pos] == :N
    raise InvalidMoveError unless self[start_pos].valid_move?(end_pos)

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]

    self 
  end


end

class NoPieceError < StandardError; end
class InvalidMoveError < StandardError; end
