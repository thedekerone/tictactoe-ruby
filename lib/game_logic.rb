class Person 
    @@board=[1,2,3,4,5,6,7,8,9]
    @@winner=false;
end

class Drawer  < Person
    def draw_board
        board_sign = @@board
        puts("\t#{board_sign[0]} | #{board_sign[1]} | #{board_sign[2]} ")
        puts ("\t---------")
        puts("\t#{board_sign[3]} | #{board_sign[4]} | #{board_sign[5]} ")
        puts ("\t---------")
        puts("\t#{board_sign[6]} | #{board_sign[7]} | #{board_sign[8]} ")
        puts ("\n")
    end  

    def isWinner(sign)
        board_sign=@@board
        @@winner=true if(board_sign[0]==sign && board_sign[1]==sign && board_sign[2]==sign)
        @@winner=true if(board_sign[3]==sign && board_sign[4]==sign && board_sign[5]==sign)
        @@winner=true if(board_sign[6]==sign && board_sign[7]==sign && board_sign[8]==sign)
        @@winner=true if(board_sign[0]==sign && board_sign[3]==sign && board_sign[6]==sign)
        @@winner=true if(board_sign[1]==sign && board_sign[4]==sign && board_sign[7]==sign)
        @@winner=true if(board_sign[2]==sign && board_sign[5]==sign && board_sign[8]==sign)
        @@winner=true if(board_sign[0]==sign && board_sign[4]==sign && board_sign[8]==sign)
        @@winner=true if(board_sign[2]==sign && board_sign[4]==sign && board_sign[6]==sign)
         
        return @@winner
    end
end

class Player < Person

    attr_accessor :moves
    attr_reader :sign

    def initialize(sign,name)
        @sign=sign
        @moves = [] 
        @name=name
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

    private

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
    drawer = Drawer.new()
    player1 = Player.new("x","player1")
    player2 = Player.new("o","player2")
    endgame=0

    while 1
        player1.make_move()
        drawer.draw_board()
        endgame+=1
        p endgame
        if(drawer.isWinner(player1.sign))  
            puts "Player 1 Wins"
            break
        end

        if endgame>8
            puts "no winner"
            break
        end
        
        player2.make_move()
        drawer.draw_board()
        endgame+=1  
        
        if(drawer.isWinner(player2.sign))
            puts "Player 2 wins"
            break
        end 
    end
end

start_game()