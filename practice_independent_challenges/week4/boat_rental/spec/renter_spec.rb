require './lib/boat'
require './lib/renter'
require 'pry'
require 'rspec'

describe Renter do 
    before(:each) do 
        @renter = Renter.new("Patrick Star", "4242424242424242")
    end
    describe 'setup' do 
        it 'is a renter' do 
            expect(@renter).to be_a Renter
        end
        it 'has a name' do 
            expect(@renter.name).to eq "Patrick Star"
        end
        it 'has a credit card' do 
            expect(@renter.credit_card_number).to eq "4242424242424242"
        end
    end
end