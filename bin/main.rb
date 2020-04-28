#!/usr/bin/env ruby

puts 'Welcome to tic-tac-to game'

puts 'Player 1 please enter your name'
player1_name = gets.chomp
puts 'check if input is valid (empty)'
puts "#{player1_name} please enter symbol you want to use"
player1_symbol = gets.chomp
puts 'check if input is valid (empty)'
p player1_symbol

puts 'Player 2 please enter your name'
player2_name = gets.chomp
puts 'check if input is valid (empty)'
puts "#{player2_name} please enter symbol you want to use"
player2_symbol = gets.chomp
puts 'check if input is valid and symbol is not the same as player1 and if is empty'
p player2_symbol

game_over = false
player_turn = 1
while game_over == false
  p 'display the board'
  if player_turn.odd?
    puts "#{player1_name} please enter your move"
    player1_move = gets.chomp
    p 'check if move is valid (either if its a valid place on the grid of if the place is already taken)'
    p player1_move
  elsif player_turn.even?
    puts "#{player2_name} please enter your move"
    player2_move = gets.chomp
    p 'check if move is valid (either if its a valid place on the grid of if the place is already taken)'
    p player2_move
  end
  puts 'check to see winner if player_turn > 5'
  player_turn += 1
  p 'The game is a drawn' if player_turn == 10
  game_over = true if player_turn == 10
end

p 'do you want to start a new game? please type yes or no'
