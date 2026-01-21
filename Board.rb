class Board
  attr_accessor :board
  def initialize
    @board = Array.new(7, Array.new(6, '0'))
  end

  def update_board(player_num, row, col)
    @board[row][col] = player_num
  end
  
  def get_board
    @board
  end

end