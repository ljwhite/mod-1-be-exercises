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

    describe 'potluck can breakdown dishes by category' do 
        before(:each) do
            @couscous_salad = Dish.new("Couscous Salad", :appetizer)
            @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
            @summer_pizza = Dish.new("Summer Pizza", :appetizer)
            @roast_pork = Dish.new("Roast Pork", :entre)
            @candy_salad = Dish.new("Candy Salad", :dessert)
            @potluck.add_dish(@couscous_salad)
            @potluck.add_dish(@cocktail_meatballs)
            @potluck.add_dish(@summer_pizza)
            @potluck.add_dish(@roast_pork)
            @potluck.add_dish(@candy_salad)
        end 

        it 'can separate dishes by category' do 
            result = @potluck.get_all_from_category(:appetizer)
            expect(result).to be_a Array 
            expect(result.first).to be_a Dish 
            expect(result.last.category).to eq(:appetizer)
            expect(result.first.name).to eq("Couscous Salad")
        end

        it 'can summarize a menu by category' do 
            result = @potluck.menu
            expect(result).to be_a Hash
            expect(result[:appetizer]).to be_a Array
            expect(result[:appetizer]).to include "Couscous Salad"
            expect(result[:appetizer]).to include "Summer Pizza"
            expect(result[:appetizer]).not_to include "Roast Pork"
            expect(result[:appetizer].length).to eq 2
        end

        it 'can take a ratio from categories' do 
            bean_dip = Dish.new("Bean Dip", :appetizer)
            @potluck.add_dish(bean_dip)
            expect(@potluck.ratio(:appetizer)).to eq(50.0)
    
        end
    end
end