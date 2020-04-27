require_relative 'board.rb'
require_relative 'player'

class Logic
  attr_accessor :player_1, :player_2, :board
  def initialize(name_1, symbol_1, name_2, symbol_2)
    @player_1 = Player.new(name_1, symbol_1)
    @player_2 = Player.new(name_2, symbol_2)
    @board = Board.new
  end

  def turn(symbol, position)
    @board.move(symbol, position)
    @board.display_board
  end

  def check_rows(symbol)
    ind = 0
    while ind < 3
      if board.grid[ind].all? { |x| x == symbol }
        break
        return true
      end
      ind += 1
    end
    return false
      
  end

  def check_columns(symbol)
    ind = 0
    while ind < 3
      if @board[[0, ind]] == symbol && @board[[1, ind]] == symbol && @board[[2, ind]] == symbol
        return true
      end
      ind += 1
      return false
    end
  end

  def check_diagonals(symbol)
    if @board[[0,0]] == symbol && @board[[1,1]] == symbol && @board[[2,2]] == symbol
      return true
    elsif @board[[2,0]] == symbol && @board[[1,1]] == symbol && @board[[0,2]] == symbol
      return true
    else
      return false
    end
  end

  def win?(symbol)
    if check_rows(symbol) || check_diagonals(symbol) || check_columns(symbol) 
      true
      @board.display_board
    else
      false
    end
  end

  def game_over?(symbol)
    if win?(symbol) || @board.full?
      true
    else
      false
    end
  end
  
  def str_int(move)
    arr = move.split("")
    arr_2 = []
    arr_2 << arr[0].to_i - 1
    arr_2 << arr[1].to_i - 1
    arr_2
  end

  def valid_move?(move)
    validation = false
    if move.include?(" ")
      validation = false
    elsif @board[str_int(move)] != "-"
      puts "Position filled. Try another"
    elsif ("1".."3").include?(move[0]) && ("1".."3").include?(move[1])
      validation = true
    end   
  end
end

