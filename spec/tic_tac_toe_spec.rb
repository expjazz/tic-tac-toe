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
end
