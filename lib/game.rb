
require "./lib/player"

class Game 
    attr_accessor :p1, :p2, :board

    def initialize
        self.board = Board.new 
        self.p1 = Player.new("\u26AA".encode('utf-8'))
        self.p2 = Player.new("\u26AB".encode('utf-8'))
    end

    def welcome
        puts "Welcome to Connect4! You are player 1."
        board.example_board
    end 

    def ask_to_play_again
        puts "Would you like to play again? Yes to continue, any other key to quit"
        response = gets.downcase.chomp
        if response == "yes"
            true
        else false
        end 
    end 

    def play
        welcome
        play_again = true
        while play_again == true
            while !board.check_full?
                p1.turn(board)
                puts board
                if board.check_win?
                    puts "Player 1 wins!"
                    break
                end 
                p2.turn(board)
                puts board
                if board.check_win?
                    puts "Player 2 wins!"
                    break
                end 
                if board.check_full?m
                    puts "The board is full, clearing board... "
                    board.clear_board
                    puts board
                end
            end 
            play_again = ask_to_play_again
            board.clear_board
        end
        puts "Goodbye!"
    end 
end 

g = Game.new
g.play