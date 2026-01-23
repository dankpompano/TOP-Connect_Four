require_relative './Board.rb'
require_relative './Player.rb'
class Game
  attr_accessor 
  
  def initialize
  @board = Board.new
  @player = Player.new  
  @current_player = @player.player1
  end

  def play_game
    until check_win || check_draw
      puts "It is #{@current_player} turn. Enter your move (e.g. A):"
      @board.display
      letter = gets.chomp
      col = @board.cols_map[letter]
      row = @board.get_row(col)
      
      # Only continue if valid move
      next unless play_turn( @current_player, row, col )

      # After round(row), the board updated. Now check win/draw.
      if check_win
        puts "#{@winner} is the winner!"
        return
      elsif check_draw
        puts "Draw!"
        return
      end
    end
  end

  def switch_turn
    if @current_player == @player.player1
      @current_player = @player.player2
    else
      @current_player = @player.player1
    end
  end

  def play_turn(current_player, row, col)
    board = Board.new 
    board.update_board(current_player, row, col)

  end

  def check_win
    if check_vert || check_hori || check_diag { return true } 
    end
  end
  
  def check_draw
    @board.get_board.flatten.none? { |space| space == "·" }
  end

  def check_vert
    current_board = @board.get_board

    (0..6).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == board[row + 1][col] &&
         cell == board[row + 2][col] &&
         cell == board[row + 3][col]
         return true
        end
      end
    end
  end

  def check_hori
    current_board = @board.get_board

    (0..6).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == board[row][col + 1] &&
         cell == board[row][col + 2] &&
         cell == board[row][col + 3]
         return true
        end
      end
    end
  end

  def check_diag
    current_board = @board.get_board
    #positive climb
    (0..6).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == board[row + 1][col + 1] &&
         cell == board[row + 2][col + 2] &&
         cell == board[row + 3][col + 3]
         return true
        end
      end
    end

    #negative descend
    (0..6).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == board[row + 1][col - 1] &&
         cell == board[row + 2][col - 2] &&
         cell == board[row + 3][col - 3]
         return true
        end
      end
    end
  end

end