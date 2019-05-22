
require "display.rb"
require "player.rb"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@display)
    @players = {1=>HumanPlayer.new(:white, @display), 2=>ComputerPlayer.new(:black, @display)}
    @current_player = 1
  end

  def play
    while true # until #game_over
      @display.render
      @players[@current_player].make_turn(@board)
    end
  end


end