require "./lib/contestant"
require "./lib/game"
require 'rspec'
require 'pry'


describe Contestant do 
    before(:each) do 
        @alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    end

    describe 'setup' do 
        it 'is a contestant' do 
            expect(@alexander).to be_a Contestant
        end
        it 'has a name' do 
            expect(@alexander.first_name).to eq 'Alexander'
            expect(@alexander.last_name).to eq 'Aigiades'
            expect(@alexander.full_name).to eq 'Alexander Aigiades'
        end
        it 'can list other features' do 
            #binding.pry
            expect(@alexander.out_of_state?).to eq false 
            expect(@alexander.state_of_residence).to eq "CO"
            expect(@alexander.spending_money).to eq 10
            expect(@alexander.game_interests).to match_array([])
        end

        it 'can add a game interest' do 
            @alexander.add_game_interest('Mega Millions')
            @alexander.add_game_interest('Pick 4')
            arr = ["Mega Millions", "Pick 4"]
            expect(@alexander.game_interests).to match_array(arr)
        end
    end
end
