class Player
  attr_accessor :player1, :player2

  def initialize(player1 = "R", player2 = "B")
    @player1 = player1
    @player2 = player2
  end
end
