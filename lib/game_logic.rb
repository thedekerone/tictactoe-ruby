class Player

    attr_accessor :moves

    @@winner=false;
    @@board=[1,2,3,4,5,6,7,8,9]

    def initialize(sign,name)
        @sign=sign
        @moves = [] 
        @name=name
    end
    
    def draw
       make_move()
       draw_board()
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

    private

    def draw_board
        puts("\t#{@@board[0]} | #{@@board[1]} | #{@@board[2]} ")
        puts ("\t---------")
        puts("\t#{@@board[3]} | #{@@board[4]} | #{@@board[5]} ")
        puts ("\t---------")
        puts("\t#{@@board[6]} | #{@@board[7]} | #{@@board[8]} ")
        puts ("\n")
    end   

    def make_move
        while 1
            puts "Enter the #{@name} move"
            move = gets.chomp().to_i
            is_valid = choose_number(move)
            if(!is_valid)
                puts "\nWrong input, try again!\n"
                next
            end
            break;
        end
    end

    def choose_number(move)
        valid=false
        @@board = @@board.map do |number|
            if(number==move)
               @moves.push(number)
               valid=true
               @sign
            else
                number
            end
        end
        valid
    end
    
end


def start_game
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
        end
end


start_game()