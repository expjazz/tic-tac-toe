require_relative 'logic'
require_relative 'player'
require_relative 'board'
require 'byebug'

puts "Welcome to tic-tac-to game"

puts "Player 1 Please enter your name"
player1_name = gets.chomp
puts "#{player1_name} please enter symbol you want to use"
player1_symbol = gets.chomp

puts "Player 2 please enter your name"
player2_name = gets.chomp
puts "#{player2_name} please enter symbol you want to use"
player2_symbol = gets.chomp

game = Logic.new(player1_name, player1_symbol, player2_name, player1_symbol)

game_over = false
player_turn = 1
9.times do
  game.board.display_board
  if player_turn.odd?
    puts "#{player1_name} please enter your move"
    move = gets.chomp
    game.board.move(player1_symbol, move)
    if game.game_over?(player1_symbol)
      #puts "congratulations #{player1_name} you have won the game"
      break
    end
  elsif player_turn.even?
    puts "#{player2_name} please enter your move"
    move = gets.chomp
    game.board.move(player2_symbol, move)
    if game.game_over?(player2_symbol)
      #puts "congratulations #{player2_name} you have won the game"
      break
    end
  end
  player_turn += 1
end