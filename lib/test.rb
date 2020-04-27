require_relative 'logic'
require_relative 'player'
require_relative 'board'

game = Logic.new("Frank", :X, "Expedito", :O)

p game.player_2.symbol