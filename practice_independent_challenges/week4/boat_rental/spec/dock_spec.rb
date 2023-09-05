require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'pry'
require 'rspec'

describe Dock do 
    before(:each) do 
        @dock = Dock.new("The Rowing Dock", 3)
        @kayak_1 = Boat.new(:kayak, 20)
        @kayak_2 = Boat.new(:kayak, 20)
        @sup_1 = Boat.new(:standup_paddle_board, 15)
        @patrick = Renter.new("Patrick Star", "4242424242424242")
        @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    end

    describe 'setup' do 
        it 'is a dock' do 
            expect(@dock).to be_a Dock
        end
        it 'has a name and max rental time' do 
            expect(@dock.name).to eq "The Rowing Dock"
            expect(@dock.max_rental_time).to eq 3
        end
    end

    describe 'dock can rent' do 
        it 'can rent boats to renters' do
            expect(@dock).to respond_to(:rent)
        end
        it 'can produce a rental log' do 
            @dock.rent(@kayak_1, @patrick)
            @dock.rent(@kayak_2, @patrick)
            @dock.rent(@sup_1, @eugene)
            log = @dock.rental_log
            expect(log).to be_a Hash 
            expect(log[@kayak_1]).to eq @patrick
            expect(log[@kayak_2]).to eq @patrick
            expect(log[@sup_1]).to eq @eugene
        end
    end
end