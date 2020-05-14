require_relative '../lib/player'
require_relative '../lib/board'

describe Player do
  let(:test_player) { Player.new('x', 'player1') }
  describe '#choose_number' do
    it 'only returns if the number is valid' do
      expect(test_player.choose_number(2)).to eql(true)
    end
    it 'number should be in the range' do
      expect(test_player.choose_number(10)).to eql(false)
    end
  end
end
