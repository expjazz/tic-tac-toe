class Player
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @move = ''
  end
  def player_move(position)
    arr = position.split("")
    arr_2 = []
    arr_2 << arr[0].to_i
    arr_2 << arr[1].to_i
    arr_2
  end
end
