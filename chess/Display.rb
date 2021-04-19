require_relative "./Board.rb"
require_relative "./cursor.rb"
require "colorize"


class Display

    P1COLOR = :red

    P2COLOR = :black
    BCOLOR1 = :white
    BCOLOR2 = :light_black
    CURSOR_COLOR = :yellow
    POSSIBLE_MOVE_COLOR = :blue
    SELECTED = :green

    attr_accessor :cursor, :board, :most_recent_move

    def initialize()
        @board = Board.new()
        @cursor = Cursor.new([7,0], @board)
    end

    def render(possible_destinations = [])
        puts "\n      0        1        2        3        4        5        6        7"
        self.board.board.each_with_index do |row, r_index|
            puts
            
            print "#{r_index} "
            colors_used_for_this_row = []
            row.each_with_index do |piece, c_index|
                pos = [r_index, c_index]
                background_color = determine_background_color(pos)
                color = determine_color(piece)
                if piece.name != "Null"
                    if contains_cursor?(pos) && is_selected?(pos)

                        print "    #{determine_character(piece)}    ".colorize(:color => color, :background => SELECTED) 
                        colors_used_for_this_row << [color, SELECTED]
                    elsif contains_cursor?(pos)
                        print "    #{determine_character(piece)}    ".colorize(:color => color, :background => CURSOR_COLOR).blink 
                        colors_used_for_this_row << [color, CURSOR_COLOR]

                    elsif possible_destinations.include?(pos)
                        
                        print "    #{determine_character(piece)}    ".colorize(:color => color, :background => POSSIBLE_MOVE_COLOR)
                        colors_used_for_this_row << [color, POSSIBLE_MOVE_COLOR]
                    else
                        
                        print "    #{determine_character(piece)}    ".colorize(:color => color, :background => background_color)
                        colors_used_for_this_row << [color, background_color]
                    end
                else
                    if contains_cursor?(pos) && is_selected?(pos)
                        print "         ".colorize(:color => color, :background => SELECTED)
                        colors_used_for_this_row << [color, SELECTED]
                    elsif contains_cursor?(pos)
                        print "         ".colorize(:color => color, :background => CURSOR_COLOR).blink
                        colors_used_for_this_row << [color, CURSOR_COLOR]
                    elsif possible_destinations.include?(pos)
                        print "         ".colorize(:color => color, :background => POSSIBLE_MOVE_COLOR)
                        colors_used_for_this_row << [color, POSSIBLE_MOVE_COLOR]
                    else
                        print "         ".colorize(:color => color, :background => background_color)
                        colors_used_for_this_row << [color, background_color]
                    end


                end  

            end

            puts
            print "  "
            colors_used_for_this_row.each do |c|
                print "         ".colorize(:color => c[0], :background => c[1])
            end
            
            
        end
        puts
        puts
    end

    

    private

    def determine_background_color(pos)
        (pos[0] + pos[1]).even? ? BCOLOR1 : BCOLOR2
    end

    def determine_color(piece)
        piece.color == "white" ? P1COLOR : P2COLOR
    end

    def determine_character(piece)
        if piece.name == "King" && piece.color == "white"
            return "\u{2654}"
        elsif piece.name == "King" && piece.color == "black"
            return "\u{265A}"
        elsif piece.name == "Queen" && piece.color == "white"
            return "\u{2655}"
        elsif piece.name == "Queen" && piece.color == "black"
            return "\u{265B}"
        elsif piece.name == "Knight" && piece.color == "white"
            return "\u{2658}"
        elsif piece.name == "Knight" && piece.color == "black"
            return "\u{265E}"
        elsif piece.name == "Bisoph" && piece.color == "white"
            return "\u{2657}"
        elsif piece.name == "Bisoph" && piece.color == "black"
            return "\u{265D}"
        elsif piece.name == "Rook" && piece.color == "white"
            return "\u{2656}"
        elsif piece.name == "Rook" && piece.color == "black"
            return "\u{265C}"
        elsif piece.name == "Pawn" && piece.color == "white"
            return "\u{2659}"
        elsif piece.name == "Pawn" && piece.color == "black"
            return "\u{265F}"
        else
            return
        end
    end

    def contains_cursor?(pos)
        self.cursor.cursor_pos == pos
    end

    def is_selected?(pos)
        return self.cursor.selected
    end

    public 

    


end




