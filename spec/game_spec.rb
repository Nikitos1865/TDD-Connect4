require "./lib/board"

describe Board do 
    describe "#mark_board" do 
        it "marks the board based on the column the user chooses" do 
            board = Board.new() 
            board.mark_board(0,'o')
            expect(board[3][0]).to eql('o')
        end 
    end 
end 