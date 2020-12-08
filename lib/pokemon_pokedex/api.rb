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
        response.body#Stores and transfers the nested data, the parse turns it into a hash or an array
       # ap pokedex #uses the gem awesome_print to format the output into something pretty and readable
        #pokemon.each do |poke|
    end
    def get_pokemon_awesome
        get_pokemon
        ap pokedex
    end
    def pokemon_roster
        pokemon_list = JSON.parse(self.get_pokemon)
        list = pokemon_list['results'].collect do |hash| #hash is the first hash of a name and url
        hash.each do |key, value|
            p  "#{key}: #{value}"
        end
    end
    def user_select(i)
        input = "https://pokeapi.co/api/v2/pokemon-species/#{i}/"
        uri = URI.parse(input) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
end
end
# names = API.new.get_pokemon
# puts names
 pokedex = API.new
 pokedex.pokemon_roster


