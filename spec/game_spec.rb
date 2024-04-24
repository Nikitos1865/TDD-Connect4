require "./lib/board"
require "./lib/player"

describe Board do 
    describe "#mark_board" do 
        it "marks the board based on the column the user chooses" do 
            b = Board.new() 
            b.mark_board(0,'o')
            expect(b.board[0][0]).to eql('o')
        end 
        it "marks the board correctly when there is already one piece in the column" do 
            b = Board.new 
            b.mark_board(0,'o')
            b.mark_board(0,'o')
            expect(b.board[0]).to eql(['o','o', ' ',' '])
        end 
        it "does not extend array if the board is full" do 
            b = Board.new 
            b.mark_board(0,'o')
            b.mark_board(0,'o')
            b.mark_board(0,'o')
            b.mark_board(0,'o')
            b.mark_board(0,'o')
            b.mark_board(0,'o')
            expect(b.board[0]).to eql(['o','o', 'o','o'])
        end 
    end
    describe "#check_win?" do 
        it "checks if the board has a win via column combination" do 
            b = Board.new
            b.board[0][0] = 'o'
            b.board[0][1] = 'o'
            b.board[0][2] = 'o'
            b.board[0][3] = 'o'
            expect(b.check_win?).to eql(true)
        end 
        it "checks for a win correctly in a different column" do
            b = Board.new
            b.board[1][0] = 'o'
            b.board[1][1] = 'o'
            b.board[1][2] = 'o'
            b.board[1][3] = 'o'
            expect(b.check_win?).to eql(true)
        end 
        it "checks for an actual win, not just a filled column" do
            b = Board.new
            b.board[1][0] = 'o'
            b.board[1][1] = 'x'
            b.board[1][2] = 'o'
            b.board[1][3] = 'o'
            expect(b.check_win?).to eql(false)
        end 
        it "checks for row win" do
            b = Board.new
            b.board[0][0] = 'o'
            b.board[1][0] = 'o'
            b.board[2][0] = 'o'
            b.board[3][0] = 'o'
            expect(b.check_win?).to eql(true)
        end
        it "checks for actual row win, not just full row " do
            b = Board.new
            b.board[0][0] = 'o'
            b.board[1][0] = 'x'
            b.board[2][0] = 'o'
            b.board[3][0] = 'o'
            expect(b.check_win?).to eql(false)
        end
        it "checks for diagonal top left to bottom right win" do 
            b = Board.new
            b.board[0][3] = 'o'
            b.board[1][2] = 'o'
            b.board[2][1] = 'o'
            b.board[3][0] = 'o'
            expect(b.check_win?).to eql(true)
        end 
        it "checks for diagonal bottom left to top right win" do 
            b = Board.new
            b.board[0][0] = 'o'
            b.board[1][1] = 'o'
            b.board[2][2] = 'o'
            b.board[3][3] = 'o'
            expect(b.check_win?).to eql(true)
        end
    end 

    describe "#check_full?" do 
        it "checks if board is full" do 
            b = Board.new
            for n in 0..3 do 
                for i in 0..3 do 
                    b.board[n][i] = 'o'
                end 
            end
            expect(b.check_full?).to eql(true)
        end
        it "does not give false positives" do 
            b = Board.new
            for n in 0..3 do 
                for i in 0..3 do 
                    b.board[n][i] = 'o'
                end 
            end
            b.board[0][3] = " "
            expect(b.check_full?).to eql(false)
        end 
    end   

    describe "#clear_board" do 
        it "clears the board" do 
            b = Board.new
            for n in 0..3 do 
                for i in 0..3 do 
                    b.board[n][i] = 'x'
                end 
            end
            b.clear_board
            puts b
            expect(b.board.all?([' ', ' ', ' ', ' '])).to eql(true)
        end 
    end 
end 

describe Player do 
    describe "#move" do 
        it "marks the board correctly according to char and column selected" do 
            p = Player.new('o')
            b = Board.new
            p.move(b,0)
            expect(b.board[0][0]).to eql('o')
        end
        
        it "marks the board correctly according to char and column selected" do 
            p = Player.new('o')
            b = Board.new
            p.move(b,2)
            p.move(b,2)
            expect(b.board[2][1]).to eql('o')
        end 
    end 
    describe "#valid_move?" do 
        it "correctly identifies an invalid move due to full column" do 
            p = Player.new('o') 
            b = Board.new 
            b.board[1][0] = "o"
            b.board[1][1] = "o"
            b.board[1][2] = 'o'
            b.board[1][3] = 'o'
            puts b 
            expect(p.valid_move?(b,1)).to eql(false)
        end
        it "correctly identifies an invalid move due non-integer move" do 
            p = Player.new('o') 
            b = Board.new 
            b.board[1][0] = "o"
            b.board[1][1] = "o"
            b.board[1][2] = 'o'
            b.board[1][3] = 'o'
            puts b 
            expect(p.valid_move?(b,"purple")).to eql(false)
        end
        it "correctly identifies an invalid move due too large of an integer" do 
            p = Player.new('o') 
            b = Board.new 
            b.board[1][0] = "o"
            b.board[1][1] = "o"
            b.board[1][2] = 'o'
            b.board[1][3] = 'o'
            puts b 
            expect(p.valid_move?(b,6)).to eql(false)
        end
    end
end 

describe Game do 
    describe "#ask_to_play_again" do
        it "verifies that returns true if player wants to play again" do
        end 
    end 
end 