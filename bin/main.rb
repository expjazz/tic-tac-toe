#!/usr/bin/env ruby

puts 'Welcome to tic-tac-to game'

puts 'Player 1 please enter your name'
player1_name = gets.chomp
puts "#{player1_name} please enter symbol you want to use"
player1_symbol = gets.chomp
p player1_symbol

puts 'Player 2 please enter your name'
player2_name = gets.chomp
puts "#{player2_name} please enter symbol you want to use"
player2_symbol = gets.chomp
p player2_symbol

game_over = false
player_turn = 1
while game_over == false
  if player_turn.odd?
    puts "#{player1_name} please enter your move"
    player1_move = gets.chomp
    p player1_move
  elsif player_turn.even?
    puts "#{player2_name} please enter your move"
    player2_move = gets.chomp
    p player2_move
  end
  puts 'check to see winner'
  player_turn += 1
  game_over = true if player_turn == 10
end
