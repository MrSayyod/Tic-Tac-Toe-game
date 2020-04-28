#!/usr/bin/env ruby
puts 'Hello world!'
puts "Please, enter your name, Player 1"
player1_name = gets.chomp.capitalize
puts "Please, select X or O"
while 
  player1_select = gets.chomp.upcase 
  if player1_select == "X"
    player1_select = "X"
    break
  elsif player1_select == "O"
    player1_select = "O"
    break
  else
      puts "Please, type 'x' or 'o'!"
      player1_select
    end
    player1_select
  end
puts "Please, enter your name, Player 2"
player2_name = gets.chomp.capitalize
if player1_select == "X"
  player2_select = "O"
else player1_select == "O"
  player2_select = "X"
end
puts "Welcome to the game Tic Tac Toe, #{player1_name} and #{player2_name}! #{player1_name} plays with #{player1_select} and #{player2_name} plays with #{player2_select}. You can start now. Happy gaming)"

class Board
  def initialize(player1, player2)
     @player1 = player1
     @player2 = player2

  end
  def display_board
    puts row = ["   " "|" "   " "|" "   "]
    puts separator = "-----------"
    puts row
    puts separator
    puts row
  end
  display_board
end
