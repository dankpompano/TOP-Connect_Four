class Board
  attr_accessor :board, :cols_map

  def initialize
    @board = Array.new(6) { Array.new(7, "·") }
    @cols_map = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6}
  end

  def update_board(player_color, row, col)
    @board[row][col] = player_color
    @board
  end

  # need to check for available spots to fall into. Gravity effect
  def get_row(col)
    index = 5
    c = col
    while index != 0
      if @board[index][c] == "·"
        return index
      else
        index -= 1
      end
    end
    return -1 
  end
  
  def get_board
    @board
  end

  def print_board
    @board.each do |row|
      puts "| " + row.join(" ") + " |"
    end

    puts "-" * 17
    puts "  A B C D E F G"
  end
  # board = Board.new
  # board.print_board

end
