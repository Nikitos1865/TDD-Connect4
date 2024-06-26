class Board 
    attr_accessor :board

    def initialize 
        @board = Array.new(4) {Array.new(4," ")}
    end 

    def to_s
        s0 = String.new("         1   2   3   4 \n\n")
        s1 = String.new("       | #{board[0][3]} | #{board[1][3]} | #{board[2][3]} | #{board[3][3]} |\n       .---------------.")
        s2 = String.new("       | #{board[0][2]} | #{board[1][2]} | #{board[2][2]} | #{board[3][2]} |\n       .---------------.")
        s3 = String.new("       | #{board[0][1]} | #{board[1][1]} | #{board[2][1]} | #{board[3][1]} |\n       .---------------.")
        s4 = String.new("       | #{board[0][0]} | #{board[1][0]} | #{board[2][0]} | #{board[3][0]} |\n")
        s5 = String.new("      -------------------")
        "#{s0}#{s1}\n#{s2}\n#{s3}\n#{s4}#{s5}"
    end 

    def mark_board(num, char)
        board[num].each_with_index do |n, i|
            if n == ' ' && i <= 3
                board[num][i] = char
                break
            end 
            next
        end 
    end 

    def check_win?
        win = false
        board.each do |val|
            if val.all?(val[0]) && val[0] != ' '
                win = true
            end 
        end 
        for n in 0..3 do
            temp_array = [board[0][n], board[1][n], board[2][n], board[3][n]]
            p temp_array
            if board[0][n] != ' ' && temp_array.all?(board[0][n])
                win = true
            end 
        end 
        temp_array = [board[0][0], board[1][1], board[2][2], board[3][3]]
        if board[0][0] != ' ' && temp_array.all?(board[0][0])
            win = true
        end 
        temp_array = [board[0][3], board[1][2], board[2][1], board[3][0]]
        if board[0][3] != ' ' && temp_array.all?(board[0][3])
            win = true
        end 
        win
    end 

    def check_full?
        full = true
        board.each do |val|
            if val.any?(" ")
                full = false
            end 
        end
        full
    end 

    def example_board 
        puts "Enter keys 1-4 to select the column in which to drop your piece"
        puts self
    end 

    def clear_board 
        @board = Array.new(4) {Array.new(4," ")}
    end 



end 

