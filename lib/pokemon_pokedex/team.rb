require "pry"
class Team
    @@team = ["Charizard", "Gengar", "Nidoking", "Alakazam", "Seadra", "Marowak"]
#create an array with 6 spots
#Stored in the array are user selected pokemon
    # def self.team_size#method that ensures there are only 6 spots filled
    #    # binding.pry
    #     if @@team.length <= 6
    #         @@team << self
    #     else 
    #         puts "It looks like you already have 6 pokemon!"
    #     end
    # end
    def save#method that adds to an array
        self.class.team << self
    end
    #binding.pry
    def self.team
        @@team
    end
    def self.clear
        @@team.clear
    end
    def list_team#method that lists out the team
        if self.team.length <= 5
            num = 6-self.team.length
            "You still have space for #{num} pokemon!Lets pick another one!"
        else
            puts "Presenting Your dreamteam!"
       # p "Current Team: " self.team.join(", ") #need to test and finalize? Should this go in cli class?
        end
    end
    def self.clear#method that clears the team
        self.class.clear
        puts "       You can't journey into the world of Pokemon with 0 pokemon!"
        puts "                     Lets fill that team up!"
    end
    def remove_last_pokemon_added
        @@team.pop
        list_team
    end
#method that removes a pokemon
#method that shows current pokemon team selected
#
end