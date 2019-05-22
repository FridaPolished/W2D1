require_relative "piece.rb"

class Rook < Piece
  include Slidable

  def move_dirs
    [:left, :right, :up, :down]
  end

  def valid_move?(pos)
    moves.include?(pos)
  end
end