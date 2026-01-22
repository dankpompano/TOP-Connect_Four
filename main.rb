require_relative 'Game'
require_relative 'Player'
require_relative 'Board'
class Main
  game = Game.new
  player1 = Player.new.player1
  player2 = Player.new.player2
  board = Board.new
  
  while game.check_win != true
    game.prompt_player
    row = gets.chomp
    col = board.get_col(row)
    if col == -1
      game.prompt_player
      row = gets.chomp
    else
      game.play_turn(player1, row, col)
      
    end
  end
end