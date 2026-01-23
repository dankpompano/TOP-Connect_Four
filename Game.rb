require_relative './Board.rb'
require_relative './Player.rb'
class Game
  attr_accessor 
  
  def initialize
  @player1 = Player.new.player1
  @player2 = Player.new.player2
  @board = Board.new
  end

  def switch_turn
    !@player1
    !@player2
  end

  def play_turn(player1, row, col)
    board = Board.new
    if(player1 == true)
      board.update_board('R', row, col)
    else
      board.update_board('B', row, col)
    end
  end

  def check_win
    current_board = @board.get_board

    current_board.each_with_index do |row, index|
      if index < 3 && row != '·'
        if((current_board[row][index] == current_board[row][index + 1]) && (current_board[row][index] == current_board[row][index + 2]) && (current_board[row][index] == current_board[row][index + 3]) && (current_board[row][index] == current_board[row][index + 4]))
          return true
        end
      end
    end

    current_board.each_with_index do |col, index|
      if index < 3 && col != '·'
        if((current_board[index][col] == current_board[index + 1][col]) && (current_board[index][col] == current_board[index + 2][col]) && (current_board[index][col] == current_board[index + 3][col]) && (current_board[index][col] == current_board[index + 4][col]))
          return true
        end
      end
    end

    # diag check
    current_board.each_with_index do |location, index|
      
    end
  end

  def check_diag
    current_board = @board.get_board
    #positive climb
    current_board.each_with_index do |row, index|
      if index < 3 && row != '·'
        if((current_board[row][index] == current_board[row + 1][index + 1]) && (current_board[row][index] == current_board[row + 1][index + 1]) && (current_board[row][index] == current_board[row + 1][index + 1]) && (current_board[row][index] == current_board[row + 1][index + 1]))
          return true
        end
      end
    end

    #negative descend
    current_board.each_with_index do |row, index|
      if index < 3 && row != '·'
        if((current_board[row][index] == current_board[row + 1][index + 1]) && (current_board[row][index] == current_board[row + 1][index + 1]) && (current_board[row][index] == current_board[row + 1][index + 1]) && (current_board[row][index] == current_board[row + 1][index + 1]))
          return true
        end
      end
    end
  end

  def prompt_player
    puts "It is Player #{player_num}'s turn. Select the row that you would like to play. E.G: A"
    row = gets.chomp
  end

end