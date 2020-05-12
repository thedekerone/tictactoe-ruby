class Player
  attr_writer :moves
  attr_reader :sign, :name, :moves

  def initialize(sign, name)
    @sign = sign
    @moves = []
    @name = name
  end

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

    Board.change_board(new_board)

    valid
  end
end
