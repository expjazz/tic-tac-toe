#!/usr/bin/env ruby

require_relative '../lib/logic'
require_relative '../lib/player'
require_relative '../lib/board'

puts 'Welcome to tic-tac-to game'

puts 'Player 1 Please enter your name'
player1_name = gets.chomp
puts "#{player1_name} please enter symbol you want to use"
player1_symbol = gets.chomp

puts 'Player 2 please enter your name'
player2_name = gets.chomp
puts "#{player2_name} please enter symbol you want to use"
player2_symbol = gets.chomp

game = Logic.new(player1_name, player1_symbol, player2_name, player1_symbol)
player_turn = 1

while player_turn < 11
  game.board.display_board
  if player_turn.odd?
    puts "#{player1_name} please enter your move (2 numeric digits) from 1 to 3 without space"
    puts 'first value for row and second value for column'
    puts 'forexample(11)'
    game.board.move(player1_symbol, game.str_int(game.get_move(gets.chomp)))
    if game.win?(player1_symbol)
      puts "congratulation #{player1_name} you have won"
      puts 'do you want to play another game answer(yes/no)'
      player_turn = game.reset_game
    end
  elsif player_turn.even?
    puts "#{player2_name} please enter your move (2 numeric digits) without space"
    puts 'first value for row and second value for column'
    puts 'forexample(11)'
    game.board.move(player2_symbol, game.str_int(game.get_move(gets.chomp)))
    if game.win?(player2_symbol)
      puts "congratulation #{player2_name} you have won"
      puts 'do you want to play another game answer(yes/no)'
      player_turn = game.reset_game
      break

    end
  end
  player_turn += 1
  puts "#{player1_name} and #{player2_name} you draw!!" if player_turn > 9
end
