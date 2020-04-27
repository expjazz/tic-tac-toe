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

9.times do
  game.board.display_board
  if player_turn.odd?
    puts "#{player1_name} please enter your move (2 numeric digits) from 1 to 3 without space"
    puts 'first value for row and second value for column'
    puts 'forexample(11)'
    move_test = false
    while move_test == false
      move = gets.chomp
      if game.valid_move?(move)
        move_test = true
      else
        puts 'Invalid move. Try again.'
      end
    end
    game.board.move(player1_symbol, game.str_int(move))
    if game.win?(player1_symbol)
      puts "congratulation #{player1_name} you have won"
      break
    elsif game.board.full?
      puts "#{player1_name} and #{player2_name} you draw!!"
      break
    end
  elsif player_turn.even?
    puts "#{player2_name} please enter your move (2 numeric digits) without space"
    puts 'first value for row and second value for column'
    puts 'forexample(11)'
    move_test = false
    while move_test == false
      move = gets.chomp
      if game.valid_move?(move)
        move_test = true
      else
        puts 'Invalid move. Try again.'
      end
    end
    game.board.move(player2_symbol, game.str_int(move))
    if game.win?(player2_symbol)
      puts "congratulation #{player2_name} you have won"
      break

    end
  end
  player_turn += 1
  puts "#{player1_name} and #{player2_name} you draw!!" if player_turn > 9
end
