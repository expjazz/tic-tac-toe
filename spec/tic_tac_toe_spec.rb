require_relative '../lib/board.rb'

describe Board do
  let(:board) { Board.new }
  describe "#initialize" do
    it 'should set @grid to be a 2D array with n rows and n columns' do
      grid = board.instance_variable_get(:@grid)
      expect(grid.length).to eql(3)   
    end

    it 'should set @grid to be a 2D array with n rows and n columns' do
      grid = board.instance_variable_get(:@grid)
      expect((grid[0].length)).to eql(3)   
    end
  end
end