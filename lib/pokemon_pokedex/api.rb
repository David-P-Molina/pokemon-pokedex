require "pry"
require "open-uri"
require "net/http"
require "json"
require "awesome_print"
class API
    #list
    def get_pokemon_list
        url = "https://pokeapi.co/api/v2/pokemon?limit=151" #the main information/ 
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
    def pokemon_roster
        pokemon_list = JSON.parse(self.get_pokemon_list)
        pokemon_list['results'].collect do |hash|
            hash.each do |key, value|
                "#{key}: #{value}"
            end
        end
    end

    #description
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
    #stat
    def select_stats#types, name, height, weight, stats 
        binding.pry
        url = "https://pokeapi.co/api/v2/pokemon/4/"
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end

    # def pokemon_stats
    #     stat_list = JSON.parse(self.select_stats)
    # end
    def height
        stat_list = JSON.parse(self.select_stats)
        #pokemon_stats
        stat_list['weight']
    end
    def weight
        stat_list = JSON.parse(self.select_stats)
        #pokemon_stats
        stat_list['weight']
    end
    def type
        stat_list = JSON.parse(self.select_stats)
        #pokemon_stats
        stat_list['types'][0]['type']['name']
    end
    def name
        stat_list = JSON.parse(self.select_stats)
        #pokemon_stats
        stat_list['species']['name']
    end
    def stats
        stat_list = JSON.parse(self.select_stats)
        #pokemon_stats #do i need to split this up?
        # counter = 0
        # while counter < 6
        p stat_list['stats'][0]['stat']['name'] ":" stat_list['stats'][0]['base_stat']#hp
        p stat_list['stats'][1]['stat']['name'] ":" stat_list['stats'][1]['base_stat']#attack
        p stat_list['stats'][2]['stat']['name'] ":" stat_list['stats'][2]['base_stat']#defense
        p stat_list['stats'][3]['stat']['name'] ":" stat_list['stats'][3]['base_stat']#special-attack
        p stat_list['stats'][4]['stat']['name'] ":" stat_list['stats'][4]['base_stat']#special-defense
        p stat_list['stats'][5]['stat']['name'] ":" stat_list['stats'][5]['base_stat']#speed
    end


end
# names = API.new.get_pokemon
# puts names
#  pokedex = API.new
#  pokedex.pokemon_roster
