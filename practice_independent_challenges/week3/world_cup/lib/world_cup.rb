require '../lib/team'
require 'pry'

class WorldCup

    attr_reader :year, :teams

    def initialize(year, teams)
        @year = year
        @teams = teams
    end

    def active_players_by_position(position)
        arr = []
        teams.each do |team|
            arr << team.players_by_position(position) if team.eliminated? == false
        end
        arr.flatten
    end

    def all_players_by_position 
        hash = Hash.new { |h,k| h[k] = []}
        teams.each do |team|
            team.players.each do |player|
                hash[player.position] << player
            end
        end
        hash
    end

    def all_players_by_position2
        arr = []
        teams.each do |team|
            team.players.each do |player|
                arr << player
            end
        end
        arr.group_by {|player| player.position}
    end
end