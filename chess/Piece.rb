
# Since git log shows two commits as "Completes Steppable module"
# Steppable module was committed on more recent commit
# Slidable module was commited on the previous commit

require "singleton"
require_relative "Steppable.rb"
require_relative "Slidable.rb"

class Piece
    attr_reader :color
    attr_accessor :board, :position
    def initialize(color, position,  board = 'b')
        @color = color
        @board = board
        @position = position
    end

    def move_into_check?(end_pos)
        c = self.color
        khelauna_board = self.board.deep_dup_board()
        khelauna_board.move_piece(self.position, end_pos)
        return khelauna_board.in_check?(c)
    end
end

class Nullpiece
    include Singleton
    attr_reader :color, :symbol
    attr_accessor :board
    
    def initialize
        @color = 'blck'
        @symbol = "E"
        @board = 'b'
    end


    def name
        return "Null"
    end

end

class Rook < Piece
    
    include Slidable

    def move_dirs
        return "HV"
    end

    def name 
        return "Rook"
    end
end

class Bisoph < Piece
    
    include Slidable
   
    def name 
        return "Bisoph"
    end
    def move_dirs
        return "D"
    end
end

class Knight < Piece
    
    include Steppable

    def name 
        return "Knight"
    end
    def move_dirs
        return "oot"
    end
end

class King < Piece
    
    include Steppable

    def name 
        return "King"
    end
    def move_dirs
        return "raja"
    end
end

class Queen < Piece
 
    include Slidable
    def name 
        return "Queen"
    end
    def move_dirs
        return "all"
    end
end

class Pawn < Piece
    
    include Steppable

    def name 
        return "Pawn"
    end
    def move_dirs
        return "piuso"
    end
end




