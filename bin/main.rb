#!/usr/bin/env ruby
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
    puts "It is your turn #{current_player[0]}. Please, choose numbers between 1 and 9."
    current_player[2] = gets.chomp.to_i
    if (1..9).include?(current_player[2]) == true
      current_player[2].checking1
    else
      puts 'You selected undefined character.  Please, choose numbers between 1 and 9.'
    end
    display_board(Array)
  end
end
arr = Board.new(player1_name.to_s, player2_name.to_s)
arr.display_board(Array)
