require "./lib/game"

class Contestant 

    attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money, :game_interests

    def initialize(hash)
        @first_name = hash[:first_name]
        @last_name = hash[:last_name]
        @age = hash[:age]
        @state_of_residence = hash[:state_of_residence]
        @spending_money = hash[:spending_money]
        @game_interests = []
    end

    def full_name
        @first_name + " " + @last_name
    end

    def out_of_state?
        @state_of_residence != "CO" 
    end

    def add_game_interest(game)
        game_interests << game
    end
    
end