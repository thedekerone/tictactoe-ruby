require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

describe Game do
  let(:test_player1) { Player.new('x', 'test player 1') }
  let(:test_game) { Game.new('x', 'x', 'x') }
  describe '#check_winner' do
    it 'Receives a player parameter and return a string with the players name' do
      expect(test_game.check_winner(test_player1, [test_player1.sign] * 9)).to eql("#{test_player1.name} Wins")
    end
  end
  describe '#winner' do
    it 'returns true if the player signs in the board matches any of the arr elements' do
      expect(test_game.winner?(test_player1.sign, [test_player1.sign] * 9)).to eql(true)
    end
  end
end
