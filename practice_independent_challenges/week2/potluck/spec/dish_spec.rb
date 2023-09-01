require 'rspec'
require './lib/dish'

describe Dish do
    before(:each) do 
        @dish = Dish.new('Couscous Salad', :appetizer)
    end
    describe "setup" do
        it 'is a dish' do 
            expect(@dish).to be_a Dish 
        end

        it 'has a name' do
            expect(@dish.name).to eq 'Couscous Salad'
        end

        it 'has a category' do
            expect(@dish.category).to eq :appetizer
        end
    end
end