require_relative "./Piece.rb"
require "colorize"
require_relative "./Impmethodsforboard.rb"
require "byebug"

class Board
    include Impmethods
    attr_writer :board
    attr_reader :board
    def initialize
        @Null_piece = Nullpiece.instance
        @board = Array.new(8) {Array.new(8, nil)}
        (0..7).each do |i|
            @board[1][i] = Pawn.new("black", [1, i])
            @board[6][i] = Pawn.new("white", [6, i])
        end
        @board[0][7] = Rook.new("black", [0, 7])
        @board[7][7] = Rook.new("white", [7, 7])
        @board[0][0] = Rook.new("black", [0,0])
        @board[7][0] = Rook.new("white", [7, 0])
        
        @board[0][6] = Knight.new("black", [0, 6])
        @board[7][6] = Knight.new("white", [7, 6])
        @board[0][1] = Knight.new("black", [0, 1])
        @board[7][1] = Knight.new("white", [7, 1])
        
        @board[0][5] = Bisoph.new("black", [0, 5])
        @board[7][5] = Bisoph.new("white", [7, 5])
        @board[0][2] = Bisoph.new("black", [0, 2])
        @board[7][2] = Bisoph.new("white", [7, 2])

        @board[0][3] = King.new("black", [0, 3])
        @board[0][4] = Queen.new("black", [0, 4])
        @board[7][3] = King.new("white", [7, 3])
        @board[7][4] = Queen.new("white", [7, 4])

        (0..7).each do |r|
            (0..7).each do |c|
                if @board[r][c] == nil
                    @board[r][c] = @Null_piece
                end
                @board[r][c].board = self

            end
        end
    end

    def [](pos)
        return @board[pos[0]][pos[1]]
    end


    def move_piece!(start_pos, end_pos)
        if start_pos[0] >= 8 || start_pos[0] < 0 || end_pos[0] >=8 || end_pos[0] < 0 || start_pos[1] >= 8 || start_pos[1] < 0 || end_pos[1] < 0 || end_pos[1] >= 8
            return "mildaina"
        elsif @board[end_pos[0]][end_pos[1]].name != "Null" && (@board[start_pos[0]][start_pos[1]].color == @board[end_pos[0]][end_pos[1]].color)
            return "mildaina"
        else
            if @board[start_pos[0]][start_pos[1]].moves.include?(end_pos) && !@board[start_pos[0]][start_pos[1]].move_into_check?(end_pos)
                temp = @board[start_pos[0]][start_pos[1]]
                @board[start_pos[0]][start_pos[1]] = @Null_piece
                @board[end_pos[0]][end_pos[1]] = temp
                @board[end_pos[0]][end_pos[1]].position = [end_pos[0], end_pos[1]]
                return "milyo"
            else
                return "mildaina"
            end

        end
            
    end

    
    def deep_dup_board()
        a = Marshal.dump(self)
        b = Marshal.load(a)
        return b
    end


end



# b = Board.new()
# b.move_piece!([1,2], [2,2])
# b.move_piece!([1,4], [2,4])
# b.move_piece!([6,1], [5,1])
# b.move_piece!([6,5], [5,5])
# b.move_piece!([7,2], [5,0])
# b.move_piece!([0,5], [5,0])

# debugger
# b.checkmate?("white")
