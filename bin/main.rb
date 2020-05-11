# !/usr/bin/env ruby
require './lib/game_logic.rb'

puts 'Welcome to the game of Tictoe'

puts 'Instructions'

puts '1: This game should be played with two players'
puts '2: Every turns you have to choose the number from 1 to 9 according to the board'
puts '3: The first player start with o and the other player will have x'
puts '4: The first person that matches the correct pattern wins the game'
puts '5: The initial board will look like this'
puts "\n\n"
puts("\t1 | 2 | 3 ")
puts "\t---------"
puts("\t4 | 5 | 6 ")
puts "\t---------"
puts("\t7 | 8 | 9 ")
puts "\n\n"

board = Board.new
player1 = Player.new('x', 'player1')
player2 = Player.new('o', 'player2')

game = Game.new(board, player1, player2)


loop do
    game.start_game
    puts board.draw_board
end
