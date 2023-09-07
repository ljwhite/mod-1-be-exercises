require 'rspec'
require './lib/photograph'
require './lib/artist'
require 'pry'

describe Photograph do 
    before(:each) do 
        @attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
          } 
        @photograph = Photograph.new(@attributes)    
    end

    describe 'setup' do 
        it 'is a photograph with attributes' do 
            expect(@photograph).to be_a Photograph
            expect(@photograph.id).to eq "1"
            name = "Rue Mouffetard, Paris (Boy with Bottles)"
            expect(@photograph.name).to eq name
            expect(@photograph.artist_id).to eq "4"
            expect(@photograph.year).to eq "1954"
        end
    end
end