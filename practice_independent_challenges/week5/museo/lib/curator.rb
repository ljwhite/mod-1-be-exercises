class Curator 

    attr_reader :photographs, :artists
    
    def initialize
        @photographs = []
        @artists = []
    end

    def add_artist(artist)
        @artists << artist
    end

    def add_photograph(photograph)
        @photographs << photograph
    end

    def find_artist_by_id(id)
        artists.find {|artist| artist.id == id}
    end

    def breakdown
        hash = Hash.new{|h,k| h[k] = []}
        photographs.each do |photo|
            artist = find_artist_by_id(photo.artist_id)
            hash[artist] << photo
        end
        hash
    end

    def prolific_artists
        arr = []
        hash = breakdown 
        hash.each do |k,v|
            arr << k if v.length > 1
        end
        arr
    end

    def photos_from_country(country)
        arr = []
        artists = self.artists.select {|artist| artist.country == country}
        artists = artists.map {|artist| artist.id}
        photographs.each do |photo|
            arr << photo if artists.include?(photo.artist_id)
        end
        arr
    end
    
end