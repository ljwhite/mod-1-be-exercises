require './lib/boat'
require './lib/renter'
require 'pry'

class Dock 
    attr_reader :name, :max_rental_time, :rental_log

    def initialize(name, max_rental_time)
        @name = name
        @max_rental_time = max_rental_time
        @rental_log = {}
    end

    def rent(boat,renter)
        rental_log[boat] = renter
    end

    def charge(boat)
        hash = {}
        if boat.hours_rented <= max_rental_time
            amount = boat.hours_rented * boat.price_per_hour
        else
            amount = max_rental_time * boat.price_per_hour
        end
        hash[:card_number] = @rental_log[boat].credit_card_number
        hash[:amount] = amount
        hash
    end
end