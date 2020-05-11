require('rainbow')

class Game
  def initialize(board, player1, player2)
    @winner = false
    @board = board
    @player1 = player1
    @player2 = player2
    @endgame = 0
  end
  

  def start_game
    player1.make_move
    board.draw_board
    endgame += 1
    if winner?(player1.sign)
      puts Rainbow('Player 1 Wins').green.bright
      break
    end

    if endgame > 8
      puts Rainbow('Match tied, No winner is selected').bright
      break
    end

    player2.make_move
    board.draw_board
    endgame += 1

    if winner?(player2.sign)
      puts Rainbow('Player 2 wins').green.bright
      break
    end
  end

  def winner?(sign)
    board_sign = Board.board
    arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    arr.each do |element|
      @winner = element.all? { |index| board_sign[index] == sign }
      return true if @winner
    end
    false
  end
end

class Board
  @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def self.board
    @@board
  end

  def self.set_board(new_board)
    @@board = new_board
  end

  def draw_board
    board_sign = Board.board

    drawed = "\t#{board_sign[0]} | #{board_sign[1]} | #{board_sign[2]}
    \t#{'-' * 9}
    \t#{board_sign[3]} | #{board_sign[4]} | #{board_sign[5]}
    \t#{'-' * 9}
    \t#{board_sign[6]} | #{board_sign[7]} | #{board_sign[8]}"

    drawed

    # puts("\t#{board_sign[0]} | #{board_sign[1]} | #{board_sign[2]} ")
    # puts "\t---------"
    # puts("\t#{board_sign[3]} | #{board_sign[4]} | #{board_sign[5]} ")
    # puts "\t---------"
    # puts("\t#{board_sign[6]} | #{board_sign[7]} | #{board_sign[8]} ")
    # puts "\n"
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
    new_board = Board.board
    new_board.map! do |number|
      if number == move
        @moves.push(number)
        valid = true
        @sign
      else
        number
      end
    end

    Board.set_board(new_board)

    valid
  end
end

# rubocop:enable
