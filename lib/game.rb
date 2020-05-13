require('rainbow')

class Game
  def initialize(board, player1, player2)
    @winner = false
    @board = board
    @player1 = player1
    @player2 = player2
    @endgame = 0
  end

  def check_winner(player, board)
    "#{player.name} Wins" if winner?(player.sign, board)
  end

  def winner?(sign, board)
    board_sign = board
    arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    arr.each do |element|
      @winner = element.all? { |index| board_sign[index] == sign }
      return true if @winner
    end
    false
  end
end
