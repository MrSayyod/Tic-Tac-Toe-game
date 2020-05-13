require '../lib/game.rb'
require '../lib/board.rb'

describe Game do
  subject(:game) { Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }

  describe '#initialize' do
    it 'should initiate a Game class' do
      expect(game.class).to eq(Game)
    end
  end

  describe '#valid_letter?' do
    it 'checks validity of players\'s choice' do
      expect(Game.valid_letter?('O')).to be true
      expect(Game.valid_letter?('X')).to be true
      expect(Game.valid_letter?('W')).to_not be true
    end
  end

  describe '#current_player' do
    it 'switch players' do
      expect(game.current_player(0)).to be true
      expect(game.current_player(1)).to_not be true
    end
  end

  # describe '#winner?' do
  #   it 'checks winner' do
  #     expect(game.winner?).to eql(true)
  #   end
  # end

  # describe '#no_winner?' do
  #   it 'checks draw' do
  #     expect(game.no_winner?).to eql(true)
  #   end
  # end

  describe '#valid_position?' do
    random = rand(1..9)
    it 'checks if selected position is valid' do
      expect(game.valid_position?(random)).to eql(false)
    end
    it 'returns false when a string is used as an argument' do
      expect(game.valid_position?('')).to be_falsey
    end
  end

  describe '#add_to_table' do
    arr = Array[1, 2, 3, 4, 5, 6, 7, 8, 9]
    random = rand(1..9)
    arr.delete_at(random - 1)
    expected = arr.insert(random - 1, nil)
    it 'should add the player choice into a board' do
      expect(game.add_to_table(random)).to eq(expected)
    end
  end
end

describe Board do
  describe '#winner?' do
    context 'When there is a winner' do
      let(:board) { ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' '] }
      let(:letter) { 'O' }
      it 'return true' do
        expect(Board.winner?(board, letter)).to eq true
      end
    end
  end

  describe '#draw?' do
    it 'returns true if board is full' do
      expect(Board.draw?(%w[X O X X O X O X O])).to be true
    end
    it 'returns false if board has an empty cell' do
      expect(Board.draw?(['X', ' '])).to be false
    end
  end
end
