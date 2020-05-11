class Board
  @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  class << self
    attr_reader :board
  end

  def self.change_board(new_board)
    @board = new_board
  end

  def draw_board
    board_sign = Board.board

    drawed = "\t#{board_sign[0]} | #{board_sign[1]} | #{board_sign[2]}
      \t#{'-' * 9}
      \t#{board_sign[3]} | #{board_sign[4]} | #{board_sign[5]}
      \t#{'-' * 9}
      \t#{board_sign[6]} | #{board_sign[7]} | #{board_sign[8]}"

    drawed
  end
end
