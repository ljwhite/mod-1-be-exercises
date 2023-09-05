require 'rspec'
require './lib/team'
require 'pry'

describe Team do 
    describe 'setup' do 
        before(:each) do 
            @team = Team.new("France")
        end
        it 'is a team' do 
            expect(@team).to be_a Team
        end
        it 'has a country' do 
            expect(@team.country).to eq "France"
        end
        it 'is not eliminated by default' do
            expect(@team.eliminated?).to be false
        end
        it  'can be eliminated' do 
            expect(@team.eliminated?).to be false
            @team.eliminated = true
            expect(@team.eliminated?).to be true
        end
    end

    describe 'add players' do 
        before(:each) do 
            @team = Team.new("France")
            @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
            @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        end
        it 'has no players by default' do
            expect(@team.players).to be_a Array
            expect(@team.players).to be_empty
        end
        it 'can add players' do 
            @team.add_player(@mbappe)
            @team.add_player(@pogba)
            expect(@team.players.length).to be 2
            expect(@team.players[0]).to eq @mbappe
        end
        it 'can list players by position' do 
            @team.add_player(@mbappe)
            @team.add_player(@pogba)
           
            expect(@team.players_by_position("midfielder")).to be_a Array
            expect(@team.players_by_position("midfielder")[0]).to eq @pogba 
            expect(@team.players_by_position("defender")).to be_empty
        end
    end
end
