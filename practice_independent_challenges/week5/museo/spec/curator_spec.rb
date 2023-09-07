require 'rspec'
require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'pry'

describe Curator do 
    before(:each) do 
       @curator = Curator.new
       @photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
        })
        @photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
        })  
        @artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
        }) 
        @artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
        })   
    end

    describe 'setup' do 
        it 'is a curator with attributes' do 
            expect(@curator).to be_a Curator
            expect(@curator.photographs).to be_empty
            expect(@curator.artists).to be_empty
        end
    end

    describe 'it can interact with artists and photographs' do 
        before(:each) do 
            @curator.add_photograph(@photo_1)
            @curator.add_photograph(@photo_2)
            @curator.add_artist(@artist_1)
            @curator.add_artist(@artist_2)
        end

        it 'can add artists add artists and photographs' do 
            expect(@curator.artists).to include @artist_1
            expect(@curator.artists).to include @artist_2
            expect(@curator.artists.length).to eq 2
        end

        it 'can add artist by id' do 
            artist = @curator.find_artist_by_id("1")
            expect(artist).to eq @artist_1
        end
    end
end