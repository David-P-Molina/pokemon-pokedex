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
    def user_select_stats(i)#types, name, height, weight, stats
        url = "https://pokeapi.co/api/v2/pokemon/#{i}/"
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
    def user_select_description(i) #description 
        url = "https://pokeapi.co/api/v2/pokemon-species/#{i}/"
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
   
end
# names = API.new.get_pokemon
# puts names
 pokedex = API.new
 p pokedex.pokemon_roster


