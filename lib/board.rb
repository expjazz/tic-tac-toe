class Board
  attr_accessor :grid
  attr_reader :size
  def initialize
    @grid = Array.new(3){Array.new(3, "-")}
    @size = 3 * 3
  end
  
  def display_board
    puts " #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]} "
    puts " #{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]} "
    puts " #{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]} "
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

  def full?
    if @grid.any? { |x| x == "-" }
      false
    else
      true
    end
  end
end

board = Board.new

# board.move('x', [0, 0])

# board.grid[0].each { |x| p x }