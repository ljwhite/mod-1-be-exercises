require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"
require 'rspec'
require 'pry'

describe ColoradoLottery do 
    before(:each) do 
        @lottery = ColoradoLottery.new
        @pick_4 = Game.new('Pick 4', 2)
        @mega_millions = Game.new('Mega Millions', 5, true)
        @cash_5 = Game.new('Cash 5', 1)
        @cash_15 = Game.new('Cash 15', 15, true)
        @alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
        @benjamin = Contestant.new({
                        first_name: 'Benjamin',
                        last_name: 'Franklin',
                        age: 17,
                        state_of_residence: 'PA',
                        spending_money: 100})
        @frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
        @winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
        @alexander.add_game_interest('Pick 4')
        @alexander.add_game_interest('Mega Millions')
        @frederick.add_game_interest('Mega Millions')
        @winston.add_game_interest('Cash 5')
        @winston.add_game_interest('Mega Millions')
        @benjamin.add_game_interest('Mega Millions')
    end

    describe 'setup' do 
        it 'has initial setup features' do
            expect(@lottery).to be_a ColoradoLottery
            expect(@lottery.registered_contestants).to be_empty
            expect(@lottery.winners).to eq []
            expect(@lottery.current_contestants).to be_empty
        end
    end

    describe 'interact with games and players' do 
        it 'can breakdown users based off age and interest' do 
            result = @lottery.interested_and_18?(@alexander, @pick_4)
            result1 = @lottery.interested_and_18?(@benjamin, @mega_millions)
            result2 = @lottery.interested_and_18?(@alexander, @cash_5)
            expect(result).to be true 
            expect(result1).to be false 
            expect(result2).to be false 
        end

        it 'can register players of age to interested games' do 
            result1 = @lottery.can_register?(@alexander, @pick_4)
            result2 = @lottery.can_register?(@alexander, @cash_5)
            result3 = @lottery.can_register?(@frederick, @mega_millions)
            result4 = @lottery.can_register?(@benjamin, @mega_millions)
            result5 = @lottery.can_register?(@frederick, @cash_5)

            expect(result1).to be true
            expect(result2).to be false
            expect(result3).to be true
            expect(result4).to be false
            expect(result5).to be false
        end
    end

    describe 'contestants can be registered@ and listed' do 
        it 'can register a contestant' do 
            result1 = @lottery.register_contestant(@alexander, @pick_4)
            result2 = @lottery.register_contestant(@alexander, @cash_5)
            result3 = @lottery.register_contestant(@frederick, @mega_millions)
            expect(@lottery.registered_contestants[@pick_4]).to include @alexander
            expect(@lottery.registered_contestants.keys).to_not include @cash_5
            expect(@lottery.registered_contestants[@mega_millions]).to include @frederick
        end

        it 'can produce a list of eligible contestants' do 
            result1 = @lottery.register_contestant(@alexander, @pick_4)
            result2 = @lottery.register_contestant(@alexander, @cash_5)
            result3 = @lottery.register_contestant(@frederick, @mega_millions)
            result4 = @lottery.register_contestant(@benjamin, @mega_millions)
            result5 = @lottery.register_contestant(@frederick, @cash_5)
            @frederick.add_game_interest('Cash 15')
            @alexander.add_game_interest('Cash 15')
            result6 = @lottery.register_contestant(@frederick, @cash_15)
            result7 = @lottery.register_contestant(@alexander, @cash_15)
            #binding.pry
            expect(@lottery.registered_contestants[@cash_15]).to include @alexander
            expect(@lottery.registered_contestants[@cash_15]).to include @frederick
            expect(@lottery.eligible_contestants(@cash_15)).to include @frederick
            expect(@lottery.eligible_contestants(@cash_15)).to_not include @alexander
        end
    end
end