class Player

    attr_reader :name, :position 

    def initialize(hash) 
        @name = hash[:name]
        @position = hash[:position]
    end
end