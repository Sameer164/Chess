module Steppable
    def moves
        moves = []
        dir = self.move_dirs
        if dir == "piuso"
            curr_pos = self.position
            a = curr_pos[0]
            b = curr_pos[1]
            

            moves << [a + 1, b] if a + 1 <= 7 && self.board[[a+1,b]].name == "Null" && self.color == "black"
            moves << [a + 1, b +1] if a + 1 <= 7 && b + 1 <= 7 && self.color == "black" && self.board[[a+1,b+1]].color == "white"
            moves << [a + 1, b -1] if a + 1 <= 7 && b - 1 >= 0 && self.color == "black" && self.board[[a+1,b-1]].color == "white"

            moves << [a - 1, b] if a - 1 >= 0 && self.board[[a-1,b]].name == "Null" && self.color == "white"
            moves << [a - 1, b +1] if a - 1 >= 0 && b + 1 <= 7 && self.color == "white" && self.board[[a-1,b+1]].color == "black"
            moves << [a - 1, b -1] if a -1 >= 0 && b - 1 >= 0 && self.color == "white" && self.board[[a-1,b-1]].color == "black"

            return moves
        elsif dir == "oot"
            curr_pos = self.position
            valid = []
            a = curr_pos[0]
            b = curr_pos[1]
            [-1, 1].each do |i|
                [-2, 2].each do |j|
                    valid << [a + i, b + j] if !(a + i < 0 || b + j >= 8 || b + j < 0 || a + i >= 8)
                    valid << [a + j, b + i] if !(a + j < 0 || b + i  < 0 || a + j >= 8 || b + i >= 8)
                end
            end
            valid.each do |pos|
                if self.board[pos].name == "Null"
                    moves << pos
                elsif self.board[pos].name != "Null" && self.board[pos].color != self.color
                    moves << pos
                else
                    next
                end
            end
            return moves
        elsif dir == "raja"
            moves = []
            valid = []
            curr_pos = self.position
            a = curr_pos[0]
            b = curr_pos[1]
            [-1, 0, 1].each do |i|
                [-1, 0,  1].each do |j|
                    if !(i == 0 && j == 0)
                        valid << [a + i, b + j] if !(a + i < 0 || b + j >= 8 || b + j < 0 || a + i >= 8)
                        valid << [a + j, b + i] if !(a + j < 0 || b + i  < 0 || a + j >= 8 || b + i >= 8)
                    end
                end
            end
        
            valid.each do |pos|
                if self.board[pos].name == "Null"
                    moves << pos
                elsif self.board[pos].name != "Null" && self.board[pos].color != self.color
                    moves << pos
                else
                    next
                end
            end
            return moves
        end
    end

end
