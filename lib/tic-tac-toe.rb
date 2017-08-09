require_relative '../lib/core/game'
require_relative '../lib/core/player'
require 'byebug'
include TicTacToe

puts 'Sup?'
puts 'Play against a person or Joshuha?'
puts '    1. Two-player game.'
puts '    2. Game against Joshua.'
print 'Input (1 or 2):     '
user_input = gets.chomp

p1class = nil
p2class = nil
p1name = nil
p2name = nil

case (user_input)
when '1'
  p1class = HumanPlayer
  p2class = HumanPlayer
when '2'
  p1class = HumanPlayer
  p2class = ComputerPlayer
  p2name = "Joshua"
else
  puts 'Invalid option. The game will close. Try hader next time.'
end

unless p1class.nil? || p2class.nil?
  if p1class == HumanPlayer
    print "Player 1, what is your name?: "
    p1name = gets.chomp
  end

  if p2class == HumanPlayer
    print "Player 2, what is your name?: "
    p2name = gets.chomp
  end

  game = Game.new(p1class, p1name, p2class, p2name)
  game.start_game
end
