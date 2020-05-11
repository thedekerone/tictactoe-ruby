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
player1 = Player.new('x', 'Player 1')
player2 = Player.new('o', 'Player 2')

game = Game.new(board, player1, player2)


def make_move(player)
    loop do
      puts Rainbow("Enter the #{player.name} move").blue.bright
      move = gets.chomp.to_i
      is_valid = player.choose_number(move)
      unless is_valid
        puts Rainbow("\nWrong input, try again!\n").red
        next
      end
      break
    end
  end



def player_turn(player, game, board)
    make_move(player)
    puts board.draw_board
    puts Rainbow(game.check_winner(player)).green.bright
end


loop do
    player_turn(player1,game, board)
    break if game.winner?(player1.sign)
    player_turn(player2, game, board)
    break if game.winner?(player2.sign)
end
