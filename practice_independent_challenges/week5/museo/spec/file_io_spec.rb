require 'rspec'
require './lib/photograph'
require './lib/artist'
require './lib/file_io'
require 'pry'

describe FileIO do 
    it 'can load artists and create a array' do 
        
        path = "./data/artists.csv"
        results = FileIO.load_artists(path)
        expect(results).to be_a Array 
        counter = 1
        results.each do |row|
            expect(row[:id]).to eq(counter)
            counter += 1
        end
        final = results.length - 1

        (0..final).each do |n|
            expect(results[n][:id]).to eq(n+1)
        end
    end

    it 'can load photographs and create an array' do 
        path = "./data/photographs.csv"
        results = FileIO.load_photographs(path)
        expect(results).to be_a Array 
        counter = 1
        results.each do |row|
            expect(row[:id]).to eq(counter)
            counter += 1
        end
        final = results.length - 1

        (0..final).each do |n|
            expect(results[n][:id]).to eq(n+1)
        end
    end
end