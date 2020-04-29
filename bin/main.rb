#!/usr/bin/env ruby
puts 'Hello world!'
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

class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def display_board(_element)
    array = Array.new(9, '')
    puts '  ' + array[0] + ' | ' + array[1] + ' | ' + array[2]
    puts separator = '-----------'
    puts '  ' + array[3] + ' | ' + array[4] + ' | ' + array[5]
    puts separator
    puts '  ' + array[6] + ' | ' + array[7] + ' | ' + array[8]
  end

  def winning
    [[array[0], array[1], array[2]],
     [array[0], array[3], array[6]],
     [array[1], array[4], array[7]],
     [array[2], array[5], array[8]],
     [array[3], array[4], array[5]],
     [array[6], array[7], array[8]],
     [array[0], array[4], array[8]],
     [array[2], array[4], array[6]]]
  end

  winning.each do |combos|
    if combos == player1_select 
      puts player1_name
    elsif combos == player2_select
      puts player2_name
    else
      puts "Tie! Enter q to quit game."
    end

  def checking1
    index = player1_choice - 1
    if array[index].empty? == true
      array[index] = player1_select
    else
      puts 'This cell was taken!!! Please, choose another option)'
    end
  end

  def checking2
    index = player2_choice - 1
    if array[index].empty? == true
      array[index] = player2_select
    else
      puts 'This cell was taken!!! Please, choose another option)'
    end
  end

  def turn
    until array.none?('') == false
      puts "It is your turn #{player1_name}. Please, choose numbers between 1 and 9."
      player1_choice = gets.chomp.to_i
      if (1..9).include?(player1_choice) == true
        player1_choice.checking1
      else
        puts 'You selected undefined character.  Please, choose numbers between 1 and 9.'
      end
      display_board(Array)
      puts "It is your turn #{player2_name}. Please, choose numbers between 1 and 9."
      player2_choice = gets.chomp.to_i
      if (1..9).include?(player2_choice) == true
        player2_choice.checking2
      else
        puts 'You selected undefined character.  Please, choose numbers between 1 and 9.'
      end
      display_board(Array)
    end
  end
end
arr = Board.new(player1_name.to_s, player2_name.to_s)
arr.display_board(Array)
