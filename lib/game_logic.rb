class Player

    attr_reader :moves

    def initialize(sign)
        @sign=sign
    end
    
    def draw
        p @@board
    end
    
    @moves = [] 

    @@board=[1,2,3,4,5,6,7,8,9]

    def make_move
        while 1
            p "enter number"
            move = gets.chomp().to_i
            choose_number(move)
            next if(move>=9 or move <1)
            break;
        end
    end

    private

    def choose_number(move)
        @@board = @@board.map do |number|
            p number
            if(number==move)
                @moves.push(number)
                @sign
            else
                number
            end
        end
    end


end

player1 = Player.new("x")
player2 = Player.new("o")


player1.make_move()

player1.draw()

p player1.moves

