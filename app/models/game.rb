class Game < ApplicationRecord

    #similar setup from tutorial, but I used multidimentional array instead of hash and I added a turns variable
    before_validation(on: :create) do
        self.state = [["", "", ""], 
                      ["", "", ""], 
                      ["", "", ""]]#initializing my state

        self.symbol = "x"
        self.turns = 0;
    end

    #similar method setup from tutorial, but edits multidimentional arary instead of hashes
    #also included a turns count everytime a player makes a move
    def move(row, col)
        state[row.to_i][col.to_i] = symbol
        self.symbol = symbol == "x" ? "o" : "x"
        self.turns = self.turns.to_i + 1
        self.save!
    end

    #my own function I implemented
    def winner
        #checking the rows
        for i in 0..2
            if (state[i][0] == state[i][1] && state[i][0] == state[i][2] && state[i][0] != "")
                return state[i][0]
            end
        end

        #checking the columns
        for i in 0..2
            if (state[0][i] == state[1][i] && state[0][i] == state[2][i] && state[0][i] != "")
                return state[0][i]
            end
        end

        #checking the diagonals
        if (state[0][0] == state[1][1] && state[0][0] == state[2][2] && state[0][0] != "")
            return state[0][0]
        elsif (state[0][2] == state[1][1] && state[0][2] == state[2][0] && state[0][2] != "")
            return state[0][2]
        end
        
        return ""
    end
end