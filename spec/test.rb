require '../lib/game.rb'
require '../lib/board.rb'

describe Game do
  subject(:game) {Game.new(arr=nil)}
  # subject(:game) {Game.new}
  # let(:board_class) {Board.new}
  # let(:board) {Game.new(@board=nil)}

  # describe '#initialize' do
    
  # end
  
  describe '#valid_letter?' do
    it 'checks validity of players\'s choice' do
      expect(Game.valid_letter?('O')).to be true
      expect(Game.valid_letter?('X')).to be true
      expect(Game.valid_letter?('W')).to_not be true
    end
  end

  describe '#current_player' do
    it 'switch players' do
      player1 = {name: 'QQQ', letter: 'X'}
      player2 = {name: 'WWW', letter: '0'}
      # current_player(number.odd?) = player2
      expect(game.current_player(1)).to eql(player1) 
    end
    # it 'switch players letters' do
    #   @letter = @current_player_letter
    #   expect(game.current_player(1)).to eql(@letter) 
    # end
  end

  # describe '#winner?' do
  #   it 'checks winner' do
  #     expect(game.winner?(%w[1 2 3])).to eql(true)
  #   end
  # end

  # describe '#no_winner?' do
  #   it 'checks draw' do
  #     expect(game.no_winner?).to eql(true)
  #   end
  # end

  # describe '#valid_position?' do
  #   it 'checks validity of positions' do
  #     expect(game.valid_position?(3)).to be true
  #   end
  # end
  
  # describe '#add_to_table' do
  #   it 'should add the player choice into a board' do
  #     expect(game.add_to_table(3)).to be true
  #   end
  # end
end