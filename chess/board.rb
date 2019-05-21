
require_relative "piece.rb"

class Board

  attr_reader :grid
  def initialize
    null_pos = NullPiece.new
    @grid = Array.new(8) { Array.new(8, null_pos) }
    self[[0,0]] = Piece.new
    self[[1,0]] = Piece.new
    self[[3,0]] = Piece.new
    self[[6,0]] = Piece.new
    self[[7,0]] = Piece.new
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
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
