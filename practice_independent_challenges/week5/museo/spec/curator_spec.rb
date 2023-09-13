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

        it 'can return a list of artists and their photographs' do 
            expected = {@artist_1 => [@photo_1], @artist_2 => [@photo_2]}
            expect(@curator.breakdown).to eq expected
        end

        it 'can return a list of artists who have more than one photo' do 
            photo_3 = double("photo")
            @curator.add_photograph(photo_3)
            allow(photo_3).to receive(:artist_id).and_return("2")
            allow(photo_3).to receive(:name).and_return("How bout these apples")
            expected = [@artist_2]
            expect(@curator.prolific_artists).to eq expected
        end

        it 'list photos taken by an artist from a specific country' do 
            photo_3 = double("photo")
            @curator.add_photograph(photo_3)
            allow(photo_3).to receive(:artist_id).and_return("2")
            allow(photo_3).to receive(:name).and_return("How bout these apples")
            expected = [@photo_2, photo_3]
            expect(@curator.photos_from_country("United States")).to eq expected
        end
    end

    describe 'it can create artists and photography objects from csv' do 
        it 'can create artists from a csv file' do 
            expect(@curator.artists.length).to eq 0
            path = "./data/artists.csv"
            @curator.create_artists_from_csv(path)
            expect(@curator.artists.length).to eq 6
        end

        it 'can create photographs from a csv file' do 
            expect(@curator.photographs.length).to eq 0
            path = "./data/photographs.csv"
            @curator.create_photographs_from_csv(path)
            expect(@curator.photographs.length).to eq 4
        end
    end

    describe 'it can find artist and photograph age' do 
        before(:each) do 
            @curator.add_photograph(@photo_1)
            @curator.add_photograph(@photo_2)
            @curator.add_artist(@artist_1)
            @curator.add_artist(@artist_2)
        end
        it 'can find the artists age at a specific photograh' do 
            result = @curator.find_artist_age(@photo_2)
            expect(result).to eq 39
        end
        it 'can find all photographs taken within a certain range' do 
            photo_3 = double("photo")
            photo_4 = double("photo")
            photo_5 = double("photo")
            @curator.add_photograph(photo_3)
            @curator.add_photograph(photo_4)
            @curator.add_photograph(photo_5)
            allow(photo_3).to receive(:year).and_return("1950")
            allow(photo_4).to receive(:year).and_return("1951")
            allow(photo_5).to receive(:year).and_return("1952")
            expected = [@photo_1, photo_3, photo_4, photo_5]
            start = 1950
            finish = 1955
            expect(@curator.find_photos_in_range(start,finish)).to eq expected
        end
    end
end