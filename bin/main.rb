#!/usr/bin/env ruby
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
puts
puts "At the begining of the game, player 1 will choose either 'X' or 'O'"
puts
continue = true
while continue
  game = Game.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])

  puts 'Enter name of player 1'
  input1 = gets.chomp.capitalize
  puts 'enter a letter to play with'
  player_1_letter = gets.chomp.upcase
  until %w[X O].include?(player_1_letter)
    puts "Please, choose 'x' or 'o'"
    letter = gets.chomp.upcase
    player_1_letter = letter if Game.valid_letter?(letter)
  end

  game.player1_name = input1
  game.player1_letter = player_1_letter

  puts "#{input1} chose #{player_1_letter}"

  puts 'Enter name of player 2'
  input2 = gets.chomp.capitalize
  player_2_letter = 'O' if player_1_letter == 'X'
  player_2_letter = 'X' if player_1_letter == 'O'
  puts "#{input2} will be playing with #{player_2_letter}"

  puts ''

  game.player2_name = input2
  game.player2_letter = player_2_letter

  puts 'The game will start ...'

  puts ''

  game_on = true

  puts '   -------------'
  puts '   |   |   |   | '
  puts '   -------------'
  puts '   |   |   |   | '
  puts '   -------------'
  puts '   |   |   |   | '
  puts '   -------------'

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

    puts '   -------------'
    puts "   | #{table[0]} | #{table[1]} | #{table[2]} | "
    puts '   -------------'
    puts "   | #{table[3]} | #{table[4]} | #{table[5]} | "
    puts '   -------------'
    puts "   | #{table[6]} | #{table[7]} | #{table[8]} | "
    puts '   -------------'
    winner = game.winner?

    if winner
      puts "#{game.current_player_name} has won the game!"
      game_on = false
    end

    draw = game.no_winner?
    if draw && !winner
      puts 'Draw! Friendship wins)'
      game_on = false
    end
    i += 1
  end
  puts 'Do you want to play again?'
  puts "Type 'y' for 'yes' or 'n' for 'no'"
  while answer = gets.chomp.downcase # rubocop:disable Lint/AssignmentInCondition:
    if answer == 'y'
      continue = true
      break
    elsif answer == 'n'
      continue = false
      break
    else
      puts "Please, press 'y' or 'n' "
      answer
    end
    answer
  end
end
puts 'Thanks for the game)'
