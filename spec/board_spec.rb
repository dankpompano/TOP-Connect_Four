require_relative '../Board'
describe Board do
  subject(:game_board) { described_class.new() }
  
  describe "#update_board" do
    it 'updates the board with valid locations' do
      game_board.update_board("R", 4, 5)      
      expect(game_board.board[4][5]).to eq("R")
    end
    
    it 'does not update the board with invalid locations' do
      expect {
        game_board.update_board("B", 10, 10)
      }.to raise_error(ArgumentError)
      expect(game_board.board.flatten).not_to include("B")
    end

    it 'allows edge cases' do
      game_board.update_board("R", 0, 0)
      expect(game_board.board[0][0]).to eq("R")
    end
    
    it 'allows edge cases' do
      game_board.update_board("R", 5, 4)
      expect(game_board.board[5][4]).to eq("R")
    end

    it 'raises an error for negative locations' do
      expect { game_board.update_board("B", -1, 0)
    }.to raise_error(ArgumentError)
      expect(game_board.board.flatten).not_to include("B")
    end
  end
  describe "#get_row" do
    
  end
end


