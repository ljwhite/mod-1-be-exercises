require "./lib/game"
require "./lib/contestant"

class ColoradoLottery
    attr_reader :registered_contestants,
                :current_contestants,
                :winners 
    
    def initialize 
        @registered_contestants = Hash.new
        @current_contestants = {}
        @winners = []
    end

    def interested_and_18?(player,game)
        player.age >= 18 && player.game_interests.include?(game.name)
    end

    def can_register?(player,game)
        return false if player.age < 18
        return false if !player.game_interests.include?(game.name)
        return false if game.national_drawing == false && player.state_of_residence != "CO"
        true


    end
end