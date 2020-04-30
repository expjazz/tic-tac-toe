require_relative '../lib/board.rb'
require_relative '../lib/logic.rb'

describe Board do
  let(:board) { Board.new }
  let(:grid) { board.instance_variable_get(:@grid) }
  describe '#initialize' do
    it 'should set @grid to be a 2D array with n rows and n columns' do
      grid = board.instance_variable_get(:@grid)
      expect(grid.length).to eql(3)
    end

    it 'should set @grid to be a 2D array with n rows and n columns' do
      grid = board.instance_variable_get(:@grid)
      expect(grid[0].length).to eql(3)
    end
  end

  describe '#[]' do
    it 'should accept an array containing a pair of indices in the form [row, column]
    and return the value position of the @board' do
      grid = board.instance_variable_get(:@grid)
      pos = [2, 2]
      expect(board[pos]).to eql(grid[2][2])
    end
  end

  describe '#[]=' do
    it 'should set the given position of @grid to the given value' do
      grid[1][1] = 'X'
      pos = [1, 1]
      expect(board[pos]).to eql('X')
    end
  end

  describe '#move' do
    it 'should accept a symbol and an positition as an argument' do
      expect { board.move('X', [0, 0]) }.to_not raise_error
    end

    it 'should set the value of the board according a given position and symbol' do
      symbol = 'O'
      pos = [0, 0]
      board[pos] = symbol
      expect(grid[0][0]).to eql('O')
    end
  end
end

describe Logic do
  let(:game) { Logic.new('Player1', 'X', 'Player2', 'O') }
  let(:board) { game.instance_variable_get(:@board) }
  describe '#check_rows' do
    it 'should accept a symbol as an argument' do
      expect { game.check_rows('X') }.to_not raise_error
    end

    it 'should return true if one of the rows is filled
    with the same symbol' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'X'
      board[[0, 2]] = 'X'
      expect(game.check_rows('X')).to be(true)
    end

    it 'should return false if one of the rows is not filled
    with the same symbol' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'O'
      board[[0, 2]] = 'X'
      expect(game.check_rows('X')).to_not be(true)
    end
  end

  describe '#check_columns' do
    it 'should accept a symbol as an argument' do
      expect { game.check_columns('O') }.to_not raise_error
    end

    it 'should return true if one of the columns
    are filled with the same symbol' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'X'
      board[[2, 0]] = 'X'
      expect(game.check_columns('X')).to be(true)
    end

    it 'should return false if one of the columns are not filled
    with the same symbol' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'O'
      board[[2, 0]] = 'X'
      expect(game.check_rows('X')).to_not be(true)
    end
  end

  describe '#check_diagonals' do
    it 'should accept a symbol as an argument' do
      expect { game.check_diagonals('X') }.to_not raise_error
    end

    it 'should return true if one of the diagonals
    are filled with the same symbol' do
      board[[0, 0]] = 'X'
      board[[1, 1]] = 'X'
      board[[2, 2]] = 'X'
      expect(game.check_diagonals('X')).to be(true)
    end

    it 'should return false if one of the diagonals are not filled
    with the same symbol' do
      board[[0, 0]] = 'X'
      board[[1, 1]] = 'O'
      board[[2, 2]] = 'X'
      expect(game.check_diagonals('X')).to_not be(true)
    end
  end

  describe '#win?' do
    it 'should accept a symbol as an argument' do
      expect { game.win?('O') }.to_not raise_error
    end

    it 'should return true if #check_rows == true' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'X'
      board[[0, 2]] = 'X'
      expect(game.win?('X')).to be(true)
    end

    it 'should return true if #check_columns == true' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'X'
      board[[2, 0]] = 'X'
      expect(game.win?('X')).to be(true)
    end

    it 'should return true if #check_diagonals == true' do
      board[[0, 0]] = 'X'
      board[[1, 1]] = 'X'
      board[[2, 2]] = 'X'
      expect(game.win?('X')).to be(true)
    end

    it 'should return false if neither #check_diagonals == true, #check columns == true
    or #check_rows == true' do
      board[[0, 0]] = 'X'
      board[[1, 1]] = '-'
      board[[2, 2]] = 'X'
      expect(game.win?('X')).to_not be(true)
    end
  end

  describe '#str_int' do
    it 'should accpt a string as an argument' do
      expect { game.str_int('11') }.to_not raise_error
    end

    it 'should convert the string into a list of two integers and returns it' do
      result = game.str_int('11')
      expect(result[0]).to be_an(Integer)
    end

    it 'should reduce the value of every index by one after a move has been provided' do
      expect(game.str_int('11')).to eql([0, 0])
    end
  end

  describe '#valid_move' do
    it 'should accpt a move as an argument' do
      expect { game.valid_move?('12') }.to_not raise_error
    end

    it 'should retutn true if a move is valid' do
      expect(game.valid_move?('21')).to be(true)
    end

    it 'should retutn false if a move is invalid' do
      expect(game.valid_move?('67')).to_not be(true)
    end

    it 'should retutn false if a move contains anything other than two integers' do
      expect(game.valid_move?('word')).to_not be(true)
    end
  end

  describe '#reset_game' do
    it 'should accept a reply as an argument' do
      expect { game.reset_game('yes') }.to_not raise_error
    end

    it 'it should return an array of a number and a condition' do
      expect(game.reset_game('yes')).to eql([1, true])
    end

    it 'it should set a new grid if reply == yes' do
      game.reset_game('yes')
      expect(board[[0, 0]]).to eql('-')
    end

    it 'should return an array with 20 and true condition as values
    when the reply is not a yes' do
      expect(game.reset_game('no')).to eql([20, true])
    end

    it 'should return an array with 2 and false if the reply functions returns false' do
      expect(game.reset_game('invalid reply')).to eql([2, false])
    end
  end

  describe '#reply' do
    it 'should accept reply as an argument' do
      expect { game.reply('yes') }.to_not raise_error
    end

    it 'should return true if reply is yes or no' do
      expect(game.reply('yes')).to be(true)
    end
  end
end
