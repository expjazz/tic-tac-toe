puts "Welcome to tic-tac-to game"

puts "Player 1 please enter your name"
player1_name = gets.chomp
puts "#{player1_name} please enter symbol you want to use"
player1_symbol = gets.chomp

puts "Player 2 please enter your name"
player2_name = gets.chomp
puts "#{player2_name} please enter symbol you want to use"
player1_symbol = gets.chomp

game_over = false
player_turn = 1
while game_over == false
  if player_turn.odd?
    puts "#{player1_name} please enter your move"
    player1_move = gets.chomp
  elsif player_turn.even?
    puts "#{player2_name} please enter your move"
    player2_move = gets.chomp
  end
  puts "check if winner"
  player_turn += 1
  if player_turn == 10
    game_over = true
  end
end