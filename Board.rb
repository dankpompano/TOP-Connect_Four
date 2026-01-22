class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7, Array.new(6, "·"))
  end

  def update_board(player_color, row, col)
    @board[row][col] = player_color
  end

  def get_col(row)
    @board[row].each do |index|
      if index == '0'
        return index
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
  board = Board.new
  board.print_board

end
