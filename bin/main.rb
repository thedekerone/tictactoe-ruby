# !/usr/bin/env ruby

puts 'Welcome to the game of Tictoe'

puts 'Instructions'

puts '1: This game should be played with two players'
puts '2: Every turns you have to choose the number using your chances'
puts '3: The first player start with o and the other player will have x'
puts '4: The first person that matches the correct pattern wins the game'
puts "\n\n"

puts("\t1 | 2 | 3 ")
puts "\t---------"
puts("\t4 | 5 | 6 ")
puts "\t---------"
puts("\t7 | 8 | 9 ")
puts "\n"
puts 'Player1: Which is next move'

puts "\n"
move = gets.chomp
puts "\n"
puts "You have chosen number #{move}"

puts "\n"

puts 'Player 1 wins'
