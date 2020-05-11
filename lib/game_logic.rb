require('rainbow')
# rubocop:disable Style/GlobalVars,Metrics/MethodLength
$board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

$winner = false

class Drawer
  def draw_board
    board_sign = $board
    puts("\t#{board_sign[0]} | #{board_sign[1]} | #{board_sign[2]} ")
    puts "\t---------"
    puts("\t#{board_sign[3]} | #{board_sign[4]} | #{board_sign[5]} ")
    puts "\t---------"
    puts("\t#{board_sign[6]} | #{board_sign[7]} | #{board_sign[8]} ")
    puts "\n"
  end

  def winner?(sign)
    board_sign = $board
    arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    arr.each do |element|
      $winner = element.all? { |index| board_sign[index] == sign }
      return true if $winner
    end

    $winner
  end
end

class Player
  attr_accessor :moves
  attr_reader :sign

  def initialize(sign, name)
    @sign = sign
    @moves = []
    @name = name
  end

  def make_move
    loop do
      puts Rainbow("Enter the #{@name} move").blue.bright
      move = gets.chomp.to_i
      is_valid = choose_number(move)
      unless is_valid
        puts Rainbow("\nWrong input, try again!\n").red
        next
      end
      break
    end
  end

  private

  def choose_number(move)
    valid = false
    $board = $board.map do |number|
      if number == move
        @moves.push(number)
        valid = true
        @sign
      else
        number
      end
    end
    valid
  end
end

def start_game
  drawer = Drawer.new
  player1 = Player.new('x', 'player1')
  player2 = Player.new('o', 'player2')
  endgame = 0

  loop do
    player1.make_move
    drawer.draw_board
    endgame += 1
    if drawer.winner?(player1.sign)
      puts Rainbow('Player 1 Wins').green.bright
      break
    end

    if endgame > 8
      puts Rainbow('Match tied, No winner is selected').bright
      break
    end

    player2.make_move
    drawer.draw_board
    endgame += 1

    if drawer.winner?(player2.sign)
      puts Rainbow('Player 2 wins').green.bright
      break
    end
  end
end

# rubocop:enable Style/GlobalVars,Metrics/MethodLength
