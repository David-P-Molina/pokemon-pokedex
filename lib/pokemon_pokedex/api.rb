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
                "#{key}: #{value}"#Instantiate Pokemon objects from each pokemon hash
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
    def select_stats(i)#types, name, height, weight, stats 
        binding.pry
        url = "https://pokeapi.co/api/v2/pokemon/#{i}/"
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        parse_response = JSON.parse(response.body)
        return {name: parse_response['species']['name']}
        return {height: parse_response['height']}
        return {weight: parse_response['weight']}
        return {type: parse_response['types'][0]['type']['name']}
        return {hp: parse_response['stats'][0]['base_stat']}
        return {attack: parse_response['stats'][1]['base_stat']}
        return {defense: parse_response['stats'][2]['base_stat']}
        return {spc_attack: parse_response['stats'][3]['base_stat']}
        return {spc_defense: parse_response['stats'][4]['base_stat']}
        return {speed: parse_response['stats'][5]['base_stat']}
    end

    # end
    # def name
    #     stat_list = JSON.parse(self.select_stats)
    #     #pokemon_stats
    #     stat_list['species']['name']
    # end
    # def stats
    #     stat_list = JSON.parse(self.select_stats)
    #     #pokemon_stats #do i need to split this up?
    #     # counter = 0
    #     # while counter < 6
    #     + ":" + stat_list['stats'][0]['base_stat']#hp
    #     + ":" + stat_list['stats'][1]['base_stat']#attack
    #     + ":" + stat_list['stats'][2]['base_stat']#defense
    #     + ":" + stat_list['stats'][3]['base_stat']#special-attack
    #     + ":" + stat_list['stats'][4]['base_stat']#special-defense
    #     + ":" + stat_list['stats'][5]['base_stat']#speed
    end


end
# names = API.new.get_pokemon
# puts names
#  pokedex = API.new
#  pokedex.pokemon_roster
