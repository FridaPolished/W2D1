
class Piece
  attr_reader :type
  def initialize
    @type = :R
  end

  def valid_move?(end_pos)
    true
  end
  
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
  def initialize
    super
    @type = :N
  end

end