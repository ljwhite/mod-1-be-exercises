require './lib/boat'
require './lib/renter'
require 'pry'
require 'rspec'

describe Boat do
    before(:each) do 
        @kayak = Boat.new(:kayak, 20)
    end
    describe 'setup' do 
        it 'is a boat' do 
            expect(@kayak).to be_a Boat 
        end
        it 'has a type' do 
            expect(@kayak.type).to eq :kayak 
        end
        it 'has a price per hour' do 
            expect(@kayak.price_per_hour).to eq(20)
        end
    end

    describe 'add hours to rental' do 
        it 'can be rented for hours' do 
            expect(@kayak.hours_rented).to eq 0
            expect(@kayak).to respond_to(:add_hour)
            @kayak.add_hour
            expect(@kayak.hours_rented).to eq 1
            @kayak.add_hour
            @kayak.add_hour
            expect(@kayak.hours_rented).to eq 3
        end
    end
end
