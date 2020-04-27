class Player
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @move = ''
  end
end
