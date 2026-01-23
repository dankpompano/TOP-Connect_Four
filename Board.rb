class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, "·") }
    @rows_map = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6}
  end

  def update_board(player_color, row, col)
    @board[row][col] = player_color
    @board
  end

  def get_col(row)
    @board[row].each do |index|
      if index == '·'
        return index.to_i
      else
        puts "Invalid move, please try again..."
        return -1
      end  
    end
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
