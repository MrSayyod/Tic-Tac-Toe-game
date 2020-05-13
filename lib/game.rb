require_relative './board.rb'

class Game
  attr_writer :player1_name, :player2_name, :player1_letter, :player2_letter
  attr_reader :current_player_letter, :current_player_name, :table

  def initialize(arr)
    @board = arr
  end

  def self.valid_letter?(letter)
    return true if %w[X O].include?(letter)
  end

  def current_player(num)
    if num.even?
      @current_player_name = @player1_name
      @current_player_letter = @player1_letter
      true
    else
      @current_player_name = @player2_name
      @current_player_letter = @player2_letter
      false
    end
  end

  def winner?
    Board.winner?(@board, @current_player_letter)
  end

  def no_winner?
    Board.draw?(@board)
  end

  def valid_position?(position)
    location = position.to_i
    location != 0 && @board[location - 1] == ' '
  end

  def add_to_table(location)
    @board[location - 1] = @current_player_letter
    @board
  end
end