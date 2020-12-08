require "pry"
require "open-uri"
require "net/http"
require "json"
require "awesome_print"
class API
    
    def get_pokemon
        url = "https://pokeapi.co/api/v2/pokemon?limit=151" #the main information/ 
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
    
    def pokemon_roster
        pokemon_list = JSON.parse(self.get_pokemon)
        pokemon_list['results'].collect do |hash|
            hash.each do |key, value|
                "#{key}: #{value}"
            end
        end
    end
    # def select_stats#types, name, height, weight, stats 
    #     binding.pry
    #     url = "https://pokeapi.co/api/v2/pokemon/4/"
    #     uri = URI.parse(url) #converts and parses out URL info
    #     response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
    #     response.body
    # end

    def select_description #description ##figure out how to add userinput
        url = "https://pokeapi.co/api/v2/pokemon-species/1/" #use string interpolation
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
    def pokemon_description
        description_list = JSON.parse(self.select_description)
        description_list['flavor_text_entries'][0] #example"A strange seed was\nplanted on its\nback at birth.
                #\fThe plant sprouts\nand grows with\nthis POKéMON." 
        end
    end
end
# names = API.new.get_pokemon
# puts names
#  pokedex = API.new
#  pokedex.pokemon_roster
