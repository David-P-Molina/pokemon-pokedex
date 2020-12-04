require "pry"
class Team
    @@team = []
#create an array with 6 spots
#Stored in the array are user selected pokemon

    def save#method that adds to an array
            @@team << self
    end
    def team_size
        if @@team.length >= 6
            puts "It looks like you already have 6 pokemon!"
        else save
    end
#method that ensures there are only 6 spots filled
#method that lists out the team
#method that clears the team
#method that removes a pokemon
#method that shows current pokemon team selected
#
end