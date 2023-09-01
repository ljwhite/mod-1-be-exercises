require 'rspec'
require './lib/dish'
require './lib/potluck'
require 'pry'

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

describe Potluck do 
    before(:each) do 
        date = "7-13-18"
        @potluck = Potluck.new(date)
    end

    describe "setup" do 
        it 'is a potluck' do 
            expect(@potluck).to be_a Potluck 
        end
        it 'has a date' do 
            expect(@potluck.date).to eq("7-13-18")
        end
        it 'has comes with no set dishes' do 
            expect(@potluck.dishes).to eq([])
        end
    end

    describe 'potluck can have dishes' do 
        before(:each) do
            @couscous_salad = Dish.new("Couscous Salad", :appetizer)
            @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        end
        it 'can add dishes' do 
            @potluck.add_dish(@couscous_salad)
            @potluck.add_dish(@cocktail_meatballs)
            expect(@potluck.dishes).to be_a Array
            expect(@potluck.dishes.length).to eq(2)
        end
        
    end
end