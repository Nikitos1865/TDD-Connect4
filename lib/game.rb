
require "./lib/player"

class Game 
    attr_accessor :p1, :p2, :board

    def initialize
        self.board = Board.new 
        self.p1 = Player.new("\u26BC".encode('utf-8'))
        self.p2 = Player.new("\u26BD".encode('utf-8'))
    end

    def welcome
        puts "Welcome to Connect4! You are player 1."
        board.example_board
    end 

    def ask_to_play_again
        while again = false
            response = gets.downcase.chomp
            if response == "yes"
                again = true
            else again = false
            end 
        end 
        again
    end 

    def play
        welcome
        play_again = true
        while !board.check_full? && play_again == true
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
            if board.check_full?
                puts "The board is full, clearing board... "
                board.clear_board

            end 
            
        end 
        puts "Goodbye!"
    end 

    




end 

g = Game.new
g.play