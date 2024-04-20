require "./lib/board"

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
        it "checks if the board has a win via 10 combinations" do 
            b = Board.new
            b.board[0][0] = 'o'
            b.board[0][1] = 'o'
            b.board[0][2] = 'o'
            b.board[0][3] = 'o'
            expect(b.check_win?).to eql(true)
        end 
    end 
    
    
end 