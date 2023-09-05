require './lib/boat'
require './lib/renter'
require 'pry'

class Dock 
    attr_reader :name, :max_rental_time, :rental_log, :revenue

    def initialize(name, max_rental_time)
        @name = name
        @max_rental_time = max_rental_time
        @rental_log = {}
        @revenue = 0
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

    def return(boat)
        amount = charge(boat)[:amount]
        @revenue += amount
        rental_log.delete(boat) if rental_log[boat]
        rental_log
    end

    def log_hour 
        rental_log.keys.each do |boat|
            boat.add_hour
        end
    end

    def revenue 
        @revenue
    end
end