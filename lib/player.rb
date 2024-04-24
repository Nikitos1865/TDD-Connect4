
require "./lib/board"

class Player

    attr_accessor :char, :num 

    def initialize(char)
        @char = char
        @num = num
    end 

    def valid_move?(board, move)
        valid = false
        if ((!move.is_a? Integer) || (move > 3) || (move < 0) || (board.board[move][3] != " "))
            valid = false
        else valid = true 
        end 
        valid
    end 

    def move(board, column)
        board.mark_board(column, self.char)
    end 

    def turn(board)
        puts "Player #{self.num}, it's your turn, pick a column 1-4"
        turn_completed = false
        while !turn_completed
            move = gets.chomp.to_i-1
            if valid_move?(board, move)
                move(board,move)
                turn_completed = true
            else puts "Invalid move, try again"
            end 
        end 
    end 
    
end  


