class Board 
    attr_accessor :board

    WINS = [
            [],
            [],
            [],
            [],
            [],
            [],
            ]

    def initialize 
        @board = Array.new(4) {Array.new(4," ")}
    end 

    def to_s
        s1 = String.new("       #{board[0][3]} | #{board[1][3]} | #{board[2][3]} | #{board[3][3]}\n      ---------------")
        s2 = String.new("       #{board[0][2]} | #{board[1][2]} | #{board[2][2]} | #{board[3][2]}\n      ---------------")
        s3 = String.new("       #{board[0][1]} | #{board[1][1]} | #{board[2][1]} | #{board[3][1]}\n      ---------------")
        s4 = String.new("       #{board[0][0]} | #{board[1][0]} | #{board[2][0]} | #{board[3][0]}\n")
        "#{s1}\n#{s2}\n#{s3}\n#{s4}"
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



end 
