require "./lib/contestant"
require "./lib/game"
require 'rspec'
require 'pry'

describe Game do 
    before(:each) do 
        @pick_4 = Game.new('Pick 4', 2)
        @mega_millions = Game.new('Mega Millions', 5, true)
    end
    describe 'setup' do 
        it 'is a game with a name and a cost' do 
            expect(@pick_4).to be_a Game
            expect(@pick_4.name).to eq "Pick 4"
            expect(@pick_4.cost).to eq 2
        end
        it 'defaults to local drawing' do 
            expect(@pick_4.national_drawing?).to be false
        end
        it 'can be a national drawing' do 
            expect(@mega_millions.national_drawing?).to be true
        end
    end
end