require_relative 'game'
require_relative 'board'


module TicTacToe
  class Player
    attr_reader :game, :name, :symbol
    def initialize(game, name, symbol)
      @game = game
      @name = name
      @symbol = symbol
    end

    def is_empty(input)
      x, y = game.get_move(input)
      game.board.is_available(x, y)
    end

    def make_mark(input)
      x, y = game.get_move(input)
      game.board.set_cell(x, y, self.symbol)
    end

  end

  class HumanPlayer < Player
    def turn
      loop do
        print "#{self.name}'s turn (#{symbol}): "
        input = gets.chomp.to_i
        break if input.between?(1, 9) && is_empty(input) && make_mark(input)
        puts "#{self}: Invalid turn."
      end
    end
  end

  class ComputerPlayer < Player
    def turn
      print "#{self}'s Turn (#{symbol}): "
      puts ''
      place_symbol
    end

    def get_moves
      available_moves = []
      game.board.grid.each_with_index do |row, i|
        row.each_with_index do |cell, location|
          if cell.value == ""
            available_moves << [cell, [i, location]]
          end
        end
      end
      finalize_pick(available_moves)
    end

    def finalize_pick(options)
      x = (options.size) - 1
      random_cell = rand(0..x)
      options[random_cell][0].value = symbol
    end

    def place_symbol
      get_moves
    end
  end
end
