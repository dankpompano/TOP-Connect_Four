require_relative '../Game.rb'
describe Game do
  subject(:game) {described_class.new() }
  describe "#switch_turns" do
    it "switches player turns" do
      game.switch_turn
      expect(game.current_player).to eq("B")
    end

    it "switches player turns twice" do
      game.switch_turn
      game.switch_turn
      expect(game.current_player).to eq("R")
    end

  end

  describe "#play_turn" do
    #already tested update_board
  end

  describe "#check_win" do
    #wrapper method for vert, hori, and diag
    #not necessary imo. will test those later
  end

  describe "#check_draw" do
  let(:board) { Board.new }
    before do
      color = ['R', 'B'].cycle
      (0..5).each do |row|
        (0..6).each do |col|
          board.update_board(color.next, row, col)
        end
      end
      it 'checks for a draw' do
        expect(game.check_draw).to eq(true)
      end

      it 'does not return a draw when spaces are available' do
        board.update_board("·", 0, 0)
        expect(game.check_draw).to eq(false)
      end
    end
      
  end
      3.times { |i| board.update_board("B", i, 1) } 

  describe "#check_vert" do
  #altered the Game class init to take board variable
    let(:board) { Board.new }
    let(:game) { Game.new(board) }

    it 'checks for a vertical win' do
      board.update_board("R", 0, 1)
      board.update_board("R", 1, 1)
      board.update_board("R", 2, 1)
      board.update_board("R", 3, 1)
      expect(game.check_vert).to eq(true)
    end

    it 'returns false when there is not a win present' do
      3.times { |i| board.update_board("B", i, 1) } 
      expect(game.check_vert).to eq(false)
    end
  end

  describe "#check_hori" do
    let(:board) { Board.new }
    let(:game) { Game.new(board) }
    it 'checks for a horizontal win' do
      4.times { |i| board.update_board("B", 1, i) } 
      expect(game.check_hori).to eq(true)
    end

    it 'returns false when there is not a win present' do
      3.times { |i| board.update_board("B", i, 1) } 
      expect(game.check_vert).to eq(false)
    end
  end

  describe "#check_diag" do
    let(:board) { Board.new }
    let(:game) { Game.new(board) }
    it 'checks for a diagonal positive slope win' do
      board.update_board("R", 0, 0)
      board.update_board("R", 1, 1)
      board.update_board("R", 2, 2)
      board.update_board("R", 3, 3)
      expect(game.check_diag).to eq(true)
    end

    it 'checks for a diagonal negative slope win' do
      board.update_board("R", 3, 3)
      board.update_board("R", 2, 2)
      board.update_board("R", 1, 1)
      board.update_board("R", 0, 0)
      expect(game.check_diag).to eq(true)
    end

    it 'returns false when there is not a win present' do
      board.update_board("R", 0, 0)
      board.update_board("R", 1, 1)
      board.update_board("R", 2, 2)      
      expect(game.check_diag).to eq(false)
    end
  end
end