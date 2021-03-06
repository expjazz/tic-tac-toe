require_relative 'board'
require_relative 'player'

# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
class Logic
  attr_reader :player_1, :player_2
  attr_accessor :board
  def initialize(name_one, symbol_one, name_two, symbol_two)
    @player_one = Player.new(name_one, symbol_one)
    @player_two = Player.new(name_two, symbol_two)
    @board = Board.new
  end

  def turn(symbol, position)
    @board.move(symbol, position)
    @board.display_board
  end

  def check_rows(symbol)
    ind = 0
    while ind < 3
      return true if board.grid[ind].all? { |x| x == symbol }

      ind += 1
    end
    false
  end

  def check_columns(symbol)
    ind = 0
    while ind < 3
      if @board[[0, ind]] == symbol && @board[[1, ind]] == symbol && @board[[2, ind]] == symbol
        return true 
      else
        return false
      end
      ind += 1
    end
  end

  def check_diagonals(symbol)
    if @board[[0, 0]] == symbol && @board[[1, 1]] == symbol && @board[[2, 2]] == symbol
      true
    elsif @board[[2, 0]] == symbol && @board[[1, 1]] == symbol && @board[[0, 2]] == symbol
      true
    else
      false
    end
  end

  def win?(symbol)
    if check_rows(symbol) || check_diagonals(symbol) || check_columns(symbol)
      true
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
    arr = move.split('')
    arr_two = []
    arr_two << arr[0].to_i - 1
    arr_two << arr[1].to_i - 1
    arr_two
  end

  def valid_move?(move)
    return true if ('1'..'3').include?(move[0]) && ('1'..'3').include?(move[1]) && @board[str_int(move)] == '-'

    false
  end

  def reset_game(reply)
    if reply(reply) == true
      if reply == 'yes'
        @board.grid = Array.new(3) { Array.new(3, '-') }
        return 1, true
      else
        return 20, true
      end
    else
      return 2, false
    end
  end

  def reply(reply)
    true if reply.include?('yes') || reply.include?('no')
  end
  # rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
end
