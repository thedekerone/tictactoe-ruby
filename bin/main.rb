#!/usr/bin/env ruby

puts 'Welcome to the game of Tictoe'

puts 'Instructions'

puts '1: This game should be played with two players'
puts '2: Every turns you have to choose the number using your chances'
puts '3: The first player start with o and the other player will have x'
puts '4: The first person that matches the correct pattern wins the game'
puts '5: Enter the letter "e" to end the game'
puts "\n\n"

loop do # rubocop:disable Metrics/BlockLength
  loop do
    puts 'DRAW BOARD WITH POSSIBLE MOVES'

    puts 'Player1 select move'

    puts "\n"
    move = gets.chomp.to_i
    puts "\n"
    puts "You have chosen number #{move}"

    puts 'verify if move is legal'
    puts "\n"

    if move < 10 and move.positive?
      puts 'player move is displayed'
      puts "\n"
      break
    else
      puts 'Wrong move, please select a valid move'
      puts "\n"

    end
  end
  puts 'Enter e if you want to finish'
  puts "\n"

  finish = gets.chomp
  if finish == 'e'
    puts 'Player 1 wins the game'
    break
  end
  loop do
    puts 'DRAW BOARD WITH POSSIBLE MOVES'

    puts 'Player2 select move'

    puts "\n"
    move = gets.chomp.to_i
    puts "\n"
    puts "You have chosen number #{move}"

    puts 'verify if move is legal'
    puts "\n"

    if move < 10 and move.positive?
      puts 'player move is displayed'
      puts "\n"
      break
    else
      puts 'Wrong move, please select a valid move'
      puts "\n"

    end
  end

  puts 'Enter e if you want to finish'
  puts "\n"

  finish = gets.chomp
  if finish == 'e'
    puts 'Player 2 wins the game'
    break
  end
end
