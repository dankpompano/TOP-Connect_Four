require_relative './Board.rb'
require_relative './Player.rb'
class Game  
  def initialize
  @board = Board.new
  @player = Player.new  
  @current_player = @player.player1
  @winner = ""
  end

  def play_game
    until check_win || check_draw
      puts "It is #{@current_player}'s turn. Enter your move (e.g. A):"
      @board.print_board
      letter = gets.chomp.upcase
      col = @board.cols_map[letter]
      row = @board.get_row(col)
      
      # Only continue if valid move
      next unless play_turn( @current_player, row, col )

      @board.print_board
      # After round(row), the board updated. Now check win/draw.
      if check_win
        puts "#{@current_player} wins!"
        return
      elsif check_draw
        puts "Draw!"
        return
      end
      switch_turn
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
    @board.update_board(current_player, row, col)
    true
  end

  def check_win
    if check_vert || check_hori || check_diag
      return true
    end
    return false
  end
  
  def check_draw
    if @board.get_board.flatten.none? { |space| space == "·" }
      return true
    else
      return false
    end
  end

  def check_vert
    current_board = @board.get_board

    (0..6).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == current_board[row + 1][col] &&
         cell == current_board[row + 2][col] &&
         cell == current_board[row + 3][col]
         return true
        end
      end
    end
    return false
  end

  def check_hori
    current_board = @board.get_board

    (0..5).each do |row|
      (0..3).each do |col|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == current_board[row][col + 1] &&
         cell == current_board[row][col + 2] &&
         cell == current_board[row][col + 3]
         return true
        end
      end
    end
    return false
  end

  def check_diag
    current_board = @board.get_board
    #positive climb
    (0..3).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == current_board[row + 1][col + 1] &&
         cell == current_board[row + 2][col + 2] &&
         cell == current_board[row + 3][col + 3]
         return true
        end
      end
    end

    #negative descend
    (3..6).each do |col|
      (0..2).each do |row|
        cell = current_board[row][col]
        next if cell == "·"

        if cell == current_board[row + 1][col - 1] &&
         cell == current_board[row + 2][col - 2] &&
         cell == current_board[row + 3][col - 3]
         return true
        end
      end
    end
  return false
  end

end