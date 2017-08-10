require_relative "../lib/core/board"

module TicTacToe
  describe Board do

    context '#initialize' do
      it 'initializes the board with a grid' do
        expect { Board.new(grid: 'grid').to_not rasie_error }
      end

      it 'sets the grid with three rows by default' do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

      it 'creates three things in reach row by default' do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
        end
      end
    end

    context '#grid' do
      it 'returns the grid' do
        board = Board.new(grid: 'blah')
        expect(board.grid).to eq 'blah'
      end
    end

    context '#get_cell' do
      it 'returns the cell based on the (x, y) coordinates' do
        grid = [['', '', ''], ['', '', 'something'], ['', '', '']]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq 'something'
      end
    end

    context '#set_cell' do
      it 'updates the value of the cell object at a (x, y) coordinate' do
        Obj = Struct.new(:value)
        grid = [[Obj.new('box'), '', ''], ['', '', ''], ['', '', '']]
        board = Board.new(grid: grid)
        board.set_cell(0, 0, 'new-box')
        expect(board.get_cell(0, 0).value).to eq 'new-box'
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty)  { TestCell.new      }

    context '#game_over' do
      it 'returns :winner when row has objects with values that are all the same' do
        grid = [
          [x_cell, x_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, y_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :winner when column has objects with values that are all the same' do
        grid = [
          [x_cell, x_cell, y_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :winner when diagonal has objects with values that are all the same' do
        grid = [
          [x_cell, x_cell, y_cell],
          [y_cell, y_cell, y_cell],
          [y_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :winner when the first winning combination is found' do
        grid = [
          [x_cell, x_cell, y_cell],
          [y_cell, y_cell, y_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :draw when all cells are used with no winning combinations' do
        grid = [
          [x_cell, x_cell, y_cell],
          [y_cell, y_cell, x_cell],
          [x_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it 'returns false when no winner and board is not full' do
        grid = [
          [x_cell, x_cell, empty],
          [y_cell, y_cell, x_cell],
          [x_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be false
      end
    end
  end
end
