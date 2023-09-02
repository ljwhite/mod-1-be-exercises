require 'rspec'
require '../lib/world_cup'
require 'pry'

describe WorldCup do 
    before(:each) do 
        @france = Team.new("France")
        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        @france.add_player(@mbappe)
        @france.add_player(@pogba)
        @croatia = Team.new("Croatia")
        @modric = Player.new({name: "Luka Modric", position: "midfielder"}) 
        @vida = Player.new({name: "Domagoj Vida", position: "defender"})
        @croatia.add_player(@modric)
        @croatia.add_player(@vida)
        @world_cup = WorldCup.new(2018, [@france, @croatia])
    end

    describe 'setup' do
        it 'is a world cup' do 
            expect(@world_cup).to be_a WorldCup
        end
        it 'has a year' do 
            expect(@world_cup.year).to eq 2018
        end
        it 'has two teams' do 
            expect(@world_cup.teams).to be_a Array
            expect(@world_cup.teams.length).to be 2
            expect(@world_cup.teams[0]).to be @france
        end
    end

    describe 'list players' do 
        it 'can lst active players by position' do 
            expect(@world_cup.active_players_by_position("midfielder")).to be_a Array
            expect(@world_cup.active_players_by_position("midfielder").length).to eq 2
            @croatia.eliminated = true 
            
            expect(@world_cup.active_players_by_position("midfielder").length).to eq 1
            expect(@world_cup.active_players_by_position("midfielder")[0]).to eq @pogba
        end

        it 'can sort all players by position' do 
            expect(@world_cup.all_players_by_position).to be_a Hash 
            expect(@world_cup.all_players_by_position["midfielder"]).to be_a Array 
            expect(@world_cup.all_players_by_position["midfielder"].length).to eq 2 
            expect(@world_cup.all_players_by_position["midfielder"]).to include @pogba
            
            expect(@world_cup.all_players_by_position2).to be_a Hash 
            expect(@world_cup.all_players_by_position2["midfielder"]).to be_a Array 
            expect(@world_cup.all_players_by_position2["midfielder"].length).to eq 2 
            expect(@world_cup.all_players_by_position2["midfielder"]).to include @pogba 
        end
    end
end