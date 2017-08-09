require_relative 'cell'
require_relative 'extensions'

module TicTacToe
  class Board
    attr_reader :grid, :cell
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def print_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
      end
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def is_available(x, y)
      get_cell(x, y).value == ""
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end


    # Check every possible winning position.
    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals # two diagonals
    end

    # Hard coding diagonals since there are only two.
    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

    # Take each of the above possible posistions and
    # run them through a loop to check if any three cell values
    # in a row/column/diagonal are the same. Return true if so.
    # Return false if not which will move onto the draw? method.
    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

  end
end
