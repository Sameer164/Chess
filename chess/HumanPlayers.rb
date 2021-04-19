
class HumanPlayers
    attr_accessor :display, :color

    def initialize(color, display)
        @color = color
        @display = display
    end

    def get_move
        b = @display.cursor.get_input
        return b
    end
end