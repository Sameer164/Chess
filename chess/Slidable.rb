require "byebug"
module Slidable
    def moves()
        dir = self.move_dirs
        if dir == "HV"
            move = []
            curr_pos = self.position
            
            for i in (curr_pos[0] + 1..7)
                if self.board[[i, curr_pos[1]]].name != 'Null' 
                    if self.color != self.board[[i, curr_pos[1]]].color
                        move << [i, curr_pos[1]]
                    end
                    break
                end
                move << [i, curr_pos[1]]
            end
            r = curr_pos[0] - 1..0
            (r.first).downto(r.last).each do |i|
                if self.board[[i, curr_pos[1]]].name != 'Null' 
                    if self.color != self.board[[i, curr_pos[1]]].color
                        move << [i, curr_pos[1]]
                    end
                    break
                end
                move << [i, curr_pos[1]]
            end
            for i in (curr_pos[1] + 1..7)
                if self.board[[curr_pos[0], i]].name != "Null"
                    if self.board[[curr_pos[0], i]].color != self.color
                        move << [curr_pos[0], i]
                    end
                    break
                end
                move << [curr_pos[0], i]
            end
            r = curr_pos[1] - 1..0
            (r.first).downto(r.last).each do |i|
                if self.board[[curr_pos[0], i]].name != "Null"
                    if self.color != self.board[[curr_pos[0], i]].color
                        move << [curr_pos[0], i]
                    end
                    break
                end
                move << [curr_pos[0], i]
            end
            return move
        elsif dir == "D"
            move = []
            curr_pos = self.position
            a = curr_pos[0] + 1
            b = curr_pos[1] + 1
            while a <= 7 && b <= 7
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a += 1
                b += 1
            end

            a = curr_pos[0] -1
            b = curr_pos[1] + 1
            while a >= 0 && b <= 7
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a -= 1
                b += 1
            end
            
            a = curr_pos[0] + 1
            b = curr_pos[1] - 1
            while a <= 7  && b >= 0
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a += 1
                b -= 1
            end
            a = curr_pos[0] - 1
            b = curr_pos[1] - 1
            while a >= 0 && b >= 0
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a -= 1
                b -= 1
            end
            return move
        else
            move = []
            curr_pos = self.position
            for i in (curr_pos[0] + 1..7)
                if self.board[[i, curr_pos[1]]].name != 'Null' 
                    if self.color != self.board[[i, curr_pos[1]]].color
                        move << [i, curr_pos[1]]
                    end
                    break
                end
                move << [i, curr_pos[1]]
            end
            r = curr_pos[0] - 1..0
            (r.first).downto(r.last) do |i|
                if self.board[[i, curr_pos[1]]].name != 'Null' 
                    if self.color != self.board[[i, curr_pos[1]]].color
                        move << [i, curr_pos[1]]
                    end
                    break
                end
                move << [i, curr_pos[1]]
            end
            for i in (curr_pos[1] + 1..7)
                if self.board[[curr_pos[0], i]].name != "Null"
                    if self.board[[curr_pos[0], i]].color != self.color
                        move << [curr_pos[0], i]
                    end
                    break
                end
                move << [curr_pos[0], i]
            end
            r = curr_pos[1] - 1..0
            (r.first).downto(r.last).each do |i|
                if self.board[[curr_pos[0], i]].name != "Null"
                    if self.color != self.board[[curr_pos[0], i]].color
                        move << [curr_pos[0], i]
                    end
                    break
                end
                move << [curr_pos[0], i]
            end
            a = curr_pos[0] + 1
            b = curr_pos[1] + 1
            while a <= 7 && b <= 7
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a += 1
                b += 1
            end
            a = curr_pos[0] -1
            b = curr_pos[1] + 1
            while a >= 0 && b <= 7
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a -= 1
                b += 1
            end
            a = curr_pos[0] + 1
            b = curr_pos[1] - 1
            while a <= 7  && b >= 0
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a += 1
                b -= 1
            end
            a = curr_pos[0] - 1
            b = curr_pos[1] - 1
            while a >= 0 && b >= 0
                if self.board[[a, b]].name != 'Null'
                    if self.board[[a, b]].color == self.color
                        break
                    else
                        move << [a, b]
                        break
                    end
                end
                move << [a, b]
                a -= 1
                b -= 1
            end
            return move
        end

    end
end
