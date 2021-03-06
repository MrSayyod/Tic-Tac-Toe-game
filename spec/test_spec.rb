require_relative '../lib/game'
require_relative '../lib/board'

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
    end
    it 'Checks validity of players\'s choice' do
      expect(Game.valid_letter?('X')).to be true
    end
    it 'checks validity of players\'s choice' do
      expect(Game.valid_letter?('W')).to be nil
    end
  end

  describe '#current_player' do
    let(:player1_name) { 'Hermela' }
    let(:player2_name) { 'Sayyod' }

    context 'when num is even' do
      let(:num) { 2 }

      it 'check if number is even' do
        expect(num.even?).to eq(true)
      end

      it 'should set player 1 name to be current player name' do
        expect(player1_name).to eq('Hermela')
      end
    end

    context 'when num isnot even' do
      let(:num) { 1 }
      it 'check if number isnot even' do
        expect(num.odd?).to be true
      end

      it 'should set player 2 name to be current player name' do
        expect(player2_name).to eq('Sayyod')
      end
    end
  end

  describe '#valid_position?' do
    random = rand(1..9)
    it 'checks if selected position is valid' do
      expect(game.valid_position?(random)).to eql(false)
    end
    it 'returns false when a string is used as an argument' do
      expect(game.valid_position?('')).to be_falsey
    end
    it 'checks validity when a value is set' do
      random = rand(1..9)
      game.add_to_table(random)
      expect(game.valid_position?(random)).to eql(false)
    end
  end

  describe '#add_to_table' do
    let(:letter) { nil }
    arr = Array[1, 2, 3, 4, 5, 6, 7, 8, 9]
    random = rand(1..9)
    arr.delete_at(random - 1)
    it 'should add the player choice into a board' do
      expected = arr.insert(random - 1, letter)
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

    context 'when there is no winner' do
      let(:board) { ['X', ' ', ' ', 'O', ' ', ' ', 'X', ' ', ' '] }
      let(:letter) { 'X' }
      it 'should return false' do
        expect(Board.winner?(board, letter)).to eq(false)
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
