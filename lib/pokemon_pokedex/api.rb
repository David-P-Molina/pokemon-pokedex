require "pry"
require "open-uri"
require "net/http"
require "json"
require "awesome_print"
class API
    URL = "https://pokeapi.co/api/v2/pokemon?limit=151" #the main information/ 
    
    def get_pokemon
        uri = URI.parse(URL) #converts and parses out URL info
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
        pokemon_list.collect do |pokemon|
            pokemon["name"]
        end
    end

end
# names = API.new.get_pokemon
# puts names
pokedex = API.new
puts pokedex.pokemon_roster










#    -https://pokeapi.co/api/v2/pokemon?limit=151                  GIVES US entry number name and URL[1 call]
#        -URL(https://pokeapi.co/api/v2/pokemon-species/#{1-151}/) GIVES US description(flavor_text_entries) [requires 151calls]
            #-continued)                                           GIVES US id number, evolved from url(evolution-chain/1/
                #-evolution-chain. GIVES US evolves to ,final evolution form
#    -https://pokeapi.co/api/v2/pokemon/#{pokemon-#1-151}/         GIVES US types, names, weight, height, stats [requires 151calls]