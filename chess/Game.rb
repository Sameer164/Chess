require_relative "./Display.rb"
require_relative "./HumanPlayers.rb"
require "byebug"

class Game
    attr_accessor :display
    def initialize
        @display = Display.new
        @black_player = HumanPlayers.new("black", @display)
        @white_player = HumanPlayers.new("white", @display)
        @current_player = @white_player
        @next_turn = @black_player
    end

    def start_game
        while (!@display.board.checkmate?("white") && !@display.board.checkmate?("black"))
            puts "Its the turn of #{@current_player.color}"
            @display.render
            count = 0
            from_pos = []
            to_pos = []
            while count != 2
                a = @current_player.get_move
                if a != nil && count == 0
                    from_pos = a
                    count += 1
                    next
                end
                if a != nil && count == 1
                    to_pos = a
                    count += 1
                    next
                end
                @display.render
            end
            

            if count == 2
                if from_pos[0] == to_pos[0] && from_pos[1] == to_pos[1]
                    next
                end

                done_or_not = @display.board.move_piece!(from_pos, to_pos)
                if done_or_not  == "mildaina"
                    puts "You can't move to that position"
                end
                if done_or_not == "milyo"
                    temp = @current_player
                    @current_player = @next_turn
                    @next_turn = temp
                end
            end


                    
        end
        @display.render
    end
end

# g = Game.new
# g.display.board.move_piece!([1,2], [2,2])
# g.display.board.move_piece!([1,4], [2,4])
# g.display.board.move_piece!([6,1], [5,1])
# g.display.board.move_piece!([6, 5], [5 ,5])
# g.display.board.move_piece!([7, 2], [5 ,0])
# g.display.board.move_piece!([0, 5], [5 ,0])
# g.start_game
g = Game.new
g.start_game



 
