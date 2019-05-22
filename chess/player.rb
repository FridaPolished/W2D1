
class Player
  def initialize(color, display)
    @color = color
    @display = display
  end
end

class HumanPlayer < Player
  def make_move(board)
    selector = nil
    until selector != nil
      selector = d.cursor.get_input
      select_piece 
    end
  end

end

class ComputerPlayer < Player
  def make_move(board)

    
  end

end


