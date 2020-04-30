class Board
  attr_accessor :grid
  attr_reader :size
  def initialize
    @grid = Array.new(3) { Array.new(3, '-') }
    @size = 3 * 3
  end

  def display_board
    "#{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}\n#{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}\n#{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]} "
  end

  def [](position)
    x, y = position
    @grid[x][y]
  end

  def []=(position, value)
    x, y = position
    @grid[x][y] = value
  end

  def move(symbol, position)
    self[position] = symbol
  end
end
