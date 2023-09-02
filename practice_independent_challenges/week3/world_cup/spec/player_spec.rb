require 'rspec'
require 'pry'
require './lib/player'

describe Player do 
    describe 'setup' do
        before(:each) do
            @player = Player.new({name: "Luka Modric", position: "midfielder"})
        end

        it 'is a player' do 
            expect(@player).to be_a Player
        end

        it 'has a name' do 
            expect(@player.name).to eq "Luka Modric"
        end

        it 'has a position' do 
            expect(@player.position).to eq 'midfielder'
        end
    end
end