class Player

    attr_accessor :moves

    def initialize(sign,name)
        @sign=sign
        @moves = [] 
        @name=name


    end
    
    def draw
        p "Enter the #{@name} move"

       make_move()
        p @@board
    end
    
    
    @@winner=false;
    @@board=[1,2,3,4,5,6,7,8,9]

    def make_move
        while 1
           
            move = gets.chomp().to_i
            choose_number(move)
            next if(move>9 or move <1)
            break;
        end
    end

    def isWinner
        c=@@board
        @@winner=true if(c[0]==@sign && c[1]==@sign && c[2]==@sign)
        @@winner=true if(c[3]==@sign && c[4]==@sign && c[5]==@sign)
        @@winner=true if(c[6]==@sign && c[7]==@sign && c[8]==@sign)
        @@winner=true if(c[0]==@sign && c[3]==@sign && c[6]==@sign)
        @@winner=true if(c[1]==@sign && c[4]==@sign && c[7]==@sign)
        @@winner=true if(c[2]==@sign && c[5]==@sign && c[8]==@sign)
        @@winner=true if(c[0]==@sign && c[4]==@sign && c[8]==@sign)
        @@winner=true if(c[2]==@sign && c[4]==@sign && c[6]==@sign)
         
        return @@winner
    end
    def choose_number(move)
        @@board = @@board.map do |number|
            
            if(number==move)
               @moves.push(number)
                @sign
            else
                number
            end
        end
    end
    



end

player1 = Player.new("x","player1")
player2 = Player.new("o","player2")



while 1

player1.draw()
 if(player1.isWinner())  

    puts "Player 1 Wins"
    break
 end
player2.draw()

 
if(player2.isWinner())
    puts "Player 2 wins"
    break
end 
p player1.moves
end
