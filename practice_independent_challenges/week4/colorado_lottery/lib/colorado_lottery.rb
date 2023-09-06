require "./lib/game"
require "./lib/contestant"
require 'pry'

class ColoradoLottery
    attr_reader :registered_contestants,
                :current_contestants,
                :winners 
    
    def initialize 
        @registered_contestants = Hash.new{|h,k| h[k]=[]}
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

    def register_contestant(player,game)
        @registered_contestants[game] << player if can_register?(player,game)
        player
    end

    def eligible_contestants(game)
        @registered_contestants[game].select do |contestant|
            contestant.spending_money > game.cost
        end
    end


end