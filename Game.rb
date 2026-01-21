require_relative './Board.rb'
require_relative './Player.rb'
class Game
  attr_accessor 
  
  def initialize
  @player1 = Player.new.player1
  @player2 = Player.new.player2
  @board = Board.new.board
  end

  def switch_turn
    !@player1
    !@player2
  end

  def make_move(player1, player2, row, col)
    if(player1 == true)
      @board = @board.update_board('1', row, col)
    else
      @board = @board.update_board('2', row, col)
    end
  end

  def check_win
    current_board = @board.get_board

    current_board.each_with_index do |row, index|
      if index < 3 && row != '0'
        if((current_board[row][index] == current_board[row][index + 1]) 
          && (current_board[row][index] == current_board[row][index + 2]) 
          && (current_board[row][index] == current_board[row][index + 3]) 
          && (current_board[row][index] == current_board[row][index + 4]))
          return true
        end
      end
    end

    current_board.each do |col, index|
      if index < 3 && col != '0'
        if((current_board[index][col] == current_board[index + 1][col]) 
          && (current_board[index][col] == current_board[index + 2][col]) 
          && (current_board[index][col] == current_board[index + 3][col]) 
          && (current_board[index][col] == current_board[index + 4][col]))
          return true
        end
      end
    end

    #diag check
    current_board.each do |asdf|
      
    end
  end

end