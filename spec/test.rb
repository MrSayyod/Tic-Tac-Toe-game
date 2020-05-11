require '../lib/game.rb'
require '../lib/board.rb'

describe Game do
  subject(:game) {Game.new(@letter=nil)}
  # subject(:game) {Game.new}
  # let(:board_class) {Board.new}
  # let(:board) {Game.new(@board=nil)}

  # describe '#initialize' do
    
  # end
  
  describe '#valid_letter?' do
    it 'checks validity of players\'s choice' do
      # new1=Game.new(@board=nil)
      # allow(Game).to receive(:valid_letter)
      # game.valid_letter
      # validity = Game.valid_letter?
      expect(game.valid_letter('x')).to eq true
      # game.valid_letter('x').should eq true
    end
  end

#   describe '#current_player' do
#     it 'switch players' do
#       # name = @player1_name
#       names = @player
#       expect(game.current_player(1)).to eql(names) 
#     end
#     it 'switch players letters' do
#       @letter = @current_player_letter
#       expect(game.current_player(1)).to eql(@letter) 
#     end
#   end

#   describe '#winner?' do
#     it 'checks winner' do
#       expect(game.winner?(%w[1 2 3])).to eql(true)
#     end
#   end

#   describe '#no_winner?' do
#     it 'checks draw' do
#       expect(game.no_winner?).to eql(true)
#     end
#   end

#   describe '#valid_position?' do
#     it 'checks validity of positions' do
#       expect(game.valid_position?(3)).to be true
#     end
#   end
  
#   describe '#add_to_table' do
#     it 'should add the player choice into a board' do
#       expect(game.add_to_table(3)).to be true
#     end
#   end
end