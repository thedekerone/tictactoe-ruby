require_relative '../lib/board.rb'

describe Board do
    let(:test_board) { Board.new }
  describe "#draw_board" do
      it "returns a board with the elements on the array" do
          expect(test_board.draw_board).to eql("\t1 | 2 | 3\n      \t---------\n      \t4 | 5 | 6\n      \t---------\n      \t7 | 8 | 9")
      end
  end

end