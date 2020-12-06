require "pry"
class Team
    @@team = []
#create an array with 6 spots
#Stored in the array are user selected pokemon
binding.pry
    def save#method that adds to an array
            @@team << self
    end
    def team_size#method that ensures there are only 6 spots filled
        if @@team.length >= 6
            puts "It looks like you already have 6 pokemon!"
        else save
    end

    def list_team#method that lists out the team
        p @@team.join(" ") #need to test and finalize? Should this go in cli class?
    end
    def self.clear#method that clears the team
        @@team.clear
    end
#method that removes a pokemon
#method that shows current pokemon team selected
#
end