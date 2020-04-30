#!/usr/bin/env ruby

require_relative '../lib/logic'
require_relative '../lib/player'
require_relative '../lib/board'

puts 'Welcome to tic-tac-to game'

puts 'Player 1 Please enter your name'
player1_name = gets.chomp
puts "#{player1_name} Your symbol will be X"
player1_symbol = 'X'

puts 'Player 2 please enter your name'
player2_name = gets.chomp
puts "#{player2_name} Your symbol will be O"
player2_symbol = 'O'

game = Logic.new(player1_name, player1_symbol, player2_name, player1_symbol)
player_turn = 1

while player_turn < 10
  puts game.board.display_board
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
        p 'invalid move'
      end
    end
    game.board.move(player1_symbol, game.str_int(move))
    if game.win?(player1_symbol)
      puts "congratulation #{player1_name} you have won"
      puts game.board.display_board
      puts 'do you want to play another game answer(yes/no)'
      validation = false
      while validation == false
        reply = gets.chomp
        player_turn, validation = game.reset_game(reply)
        puts 'wrong answer type(yes/no)' if validation == false
      end
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
        p 'invalid move'
      end
    end
    game.board.move(player2_symbol, game.str_int(move))
    if game.win?(player2_symbol)
      puts "congratulation #{player2_name} you have won"
      puts game.board.display_board
      puts 'do you want to play another game answer(yes/no)'
      validation = false
      while validation == false
        reply = gets.chomp
        player_turn, validation = game.reset_game(reply)
        puts 'wrong answer type(yes/no)' if validation == false
      end
      break

    end
  end
  player_turn += 1
  if player_turn == 10 && game.win?(player2_symbol) == false && game.win?(player1_symbol) == false
    puts "#{player1_name} and #{player2_name} you draw!!"
    p game.board.display_board
    puts 'do you want to play another game answer(yes/no)'
    validation = false
    while validation == false
      reply = gets.chomp
      player_turn, validation = game.reset_game(reply)
      puts 'wrong answer type(yes/no)' if validation == false
    end
  end
  puts 'game_over' if player_turn == 20
end
