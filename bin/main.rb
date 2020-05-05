#!/usr/bin/env ruby
<<<<<<< HEAD
require_relative '../lib/game.rb'

puts
puts 'Welcome to **Tic-Tac-toe**'
puts '      1   2   3  '
puts '    -------------'
puts '  1 | X | O | X | 3'
puts '    -------------'
puts '  4 | O | X | O | 6'
puts '    -------------'
puts '  7 | X | O | X | 9'
puts '    -------------'
puts '      7   8   9  '
puts "In this game, there are only two letters to play with 'X' and 'O'"
  .puts
puts "At the begining of the game, player 1 will choose either 'X' or 'O'"
  .puts
game = Game.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])

puts 'Enter name of player 1'
input1 = gets.chomp
input1 == '' ? input1 = 'player 1' : input1
puts 'enter a letter to play with'
player_1_letter = gets.chomp.upcase
until %w[X O].include?(player_1_letter)
  puts 'enter a valid letter to play with'
  letter = gets.chomp.upcase
  player_1_letter = letter if Game.valid_letter?(letter)
end

game.player1_name = input1
game.player1_letter = player_1_letter

puts "#{input1} chose #{player_1_letter}"

puts 'Enter name of player 2'
input2 = gets.chomp
input2 == '' ? input2 = 'player 2' : input2
player_2_letter = 'O' if player_1_letter == 'X'
player_2_letter = 'X' if player_1_letter == 'O'
puts "#{input2} will be playing with #{player_2_letter}"

puts ''

game.player2_name = input2
game.player2_letter = player_2_letter

puts 'The game will start ...'

puts ''

game_on = true

puts '      1   2   3  '
puts '    -------------'
puts '  1 |   |   |   | 3'
puts '    -------------'
puts '  4 |   |   |   | 6'
puts '    -------------'
puts '  7 |   |   |   | 9'
puts '    -------------'
puts '      7   8   9  '

i = 0
while game_on
  game.current_player(i)
  puts "#{game.current_player_name} enter a position from 1 to 9 "
  position = gets.chomp
  until game.valid_position?(position)
    puts "Error, input invalid. #{game.current_player_name} Please try again"
    position = gets.chomp
  end

  table = game.add_to_table(position.to_i)

  puts '      1   2   3  '
  puts '    -------------'
  puts "  1 | #{table[0]} | #{table[1]} | #{table[2]} | 3"
  puts '    -------------'
  puts "  4 | #{table[3]} | #{table[4]} | #{table[5]} | 6"
  puts '    -------------'
  puts "  7 | #{table[6]} | #{table[7]} | #{table[8]} | 9"
  puts '    -------------'
  puts '      7   8   9  '

  winner = game.winner?

  if winner
    puts "#{game.current_player_name} has won the game!"
    game_on = false
  end

  draw = game.no_winner?
  if draw && !winner
    puts 'this is a Draw'
    game_on = false
  end
  i += 1
end
=======
require_relative '../lib/board.rb'
puts 'Please, enter your name, Player 1'
player1_name = gets.chomp.capitalize
puts 'Please, select X or O'
while player1_select = gets.chomp.upcase # rubocop:disable Lint/AssignmentInCondition
  if player1_select == 'X'
    player1_select = 'X'
    break
  elsif player1_select == 'O'
    player1_select = 'O'
    break
  else
    puts "Please, type 'x' or 'o'!"
    player1_select
  end
  player1_select
end
puts 'Please, enter your name, Player 2'
player2_name = gets.chomp.capitalize
if player1_select == 'X'
  player2_select = 'O'
elsif player1_select == 'O'
  player2_select = 'X'
end
puts "Welcome to the game Tic Tac Toe, #{player1_name} and #{player2_name}! #{player1_name} plays with #{player1_select} and #{player2_name} plays with #{player2_select}. You can start now. Happy gaming)" # rubocop:disable Layout/LineLength

def turn
  until array.none?('') == false
    next unless array.none?('')

    puts "It is your turn #{current_player[0]}. Please, choose numbers between 1 and 9."
    current_player[2] = gets.chomp.to_i
    if (1..9).include?(current_player[2])
      current_player[2].checking1
    else
      puts 'You selected undefined character.  Please, choose numbers between 1 and 9.'
    end
    display_board(Array)
  end
end
arr = Board.new(player1_name.to_s, player2_name.to_s)
arr.display_board(Array)
>>>>>>> develop
