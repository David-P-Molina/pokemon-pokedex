require "pry"
class Team
    @@all = ["Charizard", "Gengar", "Nidoking", "Alakazam", "Seadra", "Marowak"]

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
        self.class.all << self
    end

    def self.all
        @@all
    end
    def self.clear
        @@all.clear
        puts "       You released the pokemon into the wild!"
    end
    def list_team#method that lists out the team
        if self.all.length <= 5
            num = 6-self.all.length
            "You still have space for #{num} pokemon!Lets pick another one!"
        else
            puts "Presenting Your dream Team!"
        end
    end
    def remove_last_pokemon
        @@team.pop
        list_team
    end
#method that removes a pokemon
#method that shows current pokemon team selected
#
end