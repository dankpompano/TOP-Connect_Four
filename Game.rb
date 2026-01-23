require_relative './Board.rb'
require_relative './Player.rb'
class Game
  attr_accessor 
  
  def initialize
  @player1 = Player.new.player1
  @player2 = Player.new.player2
  @board = Board.new
  end

  def play_game
    while !check_win
      
    end
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
    if check_vert || check_hori || check_diag
      puts "Congrats!"
    end
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

  def prompt_player
    puts "It is Player #{player_num}'s turn. Select the row that you would like to play. E.G: A"
    row = gets.chomp
  end

end