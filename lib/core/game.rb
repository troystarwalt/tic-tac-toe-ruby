require_relative 'board'
require_relative 'player'

module TicTacToe
  class Game

    attr_reader :board, :players, :current_player, :other_player

    def initialize(player1_class, player1_name, player2_class, player2_name)
      @players = [player1_class.new(self, player1_name, "X"),
                  player2_class.new(self, player2_name, "O")]
      @board = Board.new
      @current_player, @other_player = players.shuffle
    end

    def new_grid
      @board = Board.new
      puts "Starting new game."
    end

    def get_move(human_move)
      human_move_to_coord(human_move)
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def start_game
      puts "#{current_player.name} has randomly been selected as the first player."
      while true
        board.print_grid
        puts ''
        player_turn
        if board.game_over
          puts "game over"
          board.print_grid
          print "Play again? (Type in 'Y' to play again): "
          response = gets.chomp.upcase
          return unless response == "Y"
          new_grid
        else
          switch_players
        end
      end
    end

    def player_turn
      @current_player.turn
    end

    private

    def human_move_to_coord(human_move)
      mapping = {
        1 => [0, 0],
        2 => [0, 1],
        3 => [0, 2],
        4 => [1, 0],
        5 => [1, 1],
        6 => [1, 2],
        7 => [2, 0],
        8 => [2, 1],
        9 => [2, 2]
      }
      mapping[human_move]
    end

  end
end
