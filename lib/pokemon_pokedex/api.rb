require "pry"
require "open-uri"
require "net/http"
require "json"
require "awesome_print"
class API
    URL = "https://pokeapi.co/api/v2/pokedex/2" #the main information
    def self.get_pokemon()
        uri = URI.parse(URL) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        pokedex = JSON.parse(response.body)#Stores and transfers the nested data, the parse turns it into a hash or an array
       ap pokedex #uses the gem awesome_print to format the output into something pretty and readable
        #pokemon.each do |poke|
    end
end