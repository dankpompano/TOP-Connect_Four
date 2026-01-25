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

  describe "#check_vert" do
    
  end

  describe "#check_hori" do
    
  end

  describe "#check_diag" do
    
  end
end