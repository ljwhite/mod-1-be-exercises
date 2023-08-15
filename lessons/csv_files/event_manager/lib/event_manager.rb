# ./lib/event_manager.rb
require "csv"
require 'pry'

puts "EventManager initialized."

path = "data/event_attendees.csv"

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

path = "data/event_attendees.csv"

contents = CSV.open(path, headers: true, header_converters: :symbol)

contents. each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    puts "#{name}, #{zipcode}"
end
