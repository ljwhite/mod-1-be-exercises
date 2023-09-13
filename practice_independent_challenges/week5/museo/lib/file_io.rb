require 'csv'

class FileIO

    def self.load_artists(path)
        contents = CSV.open(path, headers: true, header_converters: :symbol)
        artists = []
        contents.each do |row|
            artist = {
                id: row[:id].to_i,
                name: row[:name],
                born: row[:born].to_i,
                died: row[:died].to_i,
                country: row[:country]
            }
            artists << artist
        end
        artists
    end

    def self.load_photographs(path)
        contents = CSV.open(path, headers: true, header_converters: :symbol)
        photographs = []
        contents.each do |row|
            photograph = {
                id: row[:id].to_i,
                name: row[:name],
                artist_id: row[:artist_id].to_i,
                year: row[:year].to_i
            }
            photographs << photograph
        end
        photographs
    end

end