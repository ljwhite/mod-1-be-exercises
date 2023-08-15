require 'pry'
require './lib/zipcodable.rb'

class Attendee 
    include Zipcodable 

    attr_reader :id, :first_name, :last_name, :zipcode
    def initialize(id, first_name, last_name, zipcode)
            @id = id
            @first_name = first_name
            @last_name = last_name
            @zipcode = Zipcodable.clean_zipcode(zipcode)
            #@name = first_name + " " + last_name
    end

    def name 
        name = first_name + " " + last_name
    end
end
