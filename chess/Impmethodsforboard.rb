
require "byebug"

module Impmethods
    def move_piece(start_pos, end_pos)
        if start_pos[0] >= 8 || start_pos[0] < 0 || end_pos[0] >=8 || end_pos[0] < 0 || start_pos[1] >= 8 || start_pos[1] < 0 || end_pos[1] < 0 || end_pos[1] >= 8
            raise StandardError
        elsif @board[end_pos[0]][end_pos[1]].name != "Null" && @board[end_pos[0]][end_pos[1]].color == @board[start_pos[0]][start_pos[1]].color
            raise StandardError
        else

            temp = @board[start_pos[0]][start_pos[1]]
            @board[start_pos[0]][start_pos[1]] = @Null_piece
            @board[end_pos[0]][end_pos[1]] = temp
            @board[end_pos[0]][end_pos[1]].position = [end_pos[0], end_pos[1]]

        end
            
    end

  
    
    
    def checkmate?(color)
        c = 0
        found = false
        @board.each do |r|
            r.each do |piece|
                if piece.name == "King" && piece.color == color
                    c = piece
                    found = true
                    break
                end
            end
            if found == true
                break
            end
        end
        
        all_dirs = c.moves


        ### Write a method named "can_i_move_other_pieces_to_be_saved" which if the color is in check and there is no where to move
        ###checks the moves of other pieces of the same color to see if any of those moves of the other players can remove the check of the color. 

        
        if all_dirs.length == 0 && self.in_check?(color) # && !can_i_move_other_pieces_to_be_saved(color)
            return true
        end
        if all_dirs.length == 0 # && !self.in_check?(color) && can_i_move_other_pieces_to_be_saved(color)
            return false
        end

        
        
      
        all_dirs.each do |end_pos|
            if !c.move_into_check?(end_pos)
                return false
            end
        end

        if self.in_check?(color)
            return true
        else
            return false
        end
    end


    def can_it_move_there?(piece, end_pos)
        return true if piece.moves.include?(end_pos)
        return false
    end
    
    def in_check?(color)
        c = 0
        found = false
        @board.each do |r|
            r.each do |piece|
                if piece.name == "King" && piece.color == color
                    c = piece
                    found = true
                    break
                end
            end
            if found == true
                break
            end
        end

        
        is_checked_by = 0
        if color == 'black'
            is_checked_by = 'white'
        elsif color == 'white'
            is_checked_by = 'black'
        end

        @board.each do |r|
            r.each do |p|
                if p.name != "Null"
                    if p.color == is_checked_by
                        if p.moves.include?(c.position)
                            return true
                        end
                    end
                end
            end
        end
        return false

    end
end
