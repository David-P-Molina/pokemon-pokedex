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
        binding.pry
        pokemon_list = JSON.parse(self.get_pokemon_list)
        pokemon_list['results'].collect do |name, url|
            Pokemon.new(name, url)
            #    "#{key}: #{value}"#Instantiate Pokemon objects from each pokemon hash
            #returns {"name"=>"bulbasaur", "url"=>"https://pokeapi.co/api/v2/pokemon/1/"}, {"name"=>"ivysaur", "url"=>"https://pokeapi.co/api/v2/pokemon/2/"}
        end
    end

    #description
    def select_description(i) #description ##figure out how to add userinput
        url = "https://pokeapi.co/api/v2/pokemon-species/#{i}/" #use string interpolation
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
    def select_stats(url)#types, name, height, weight, stats 
        binding.pry
        poke_url = url
        uri = URI.parse(poke_url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        parse_response = JSON.parse(response.body)
        Pokemon.name = {name: parse_response['species']['name']}
        Pokemon.height = {height: parse_response['height']}
        Pokemon.weight = {weight: parse_response['weight']}
        Pokemon.type = {type: parse_response['types'][0]['type']['name']}
        Pokemon.hp = {hp: parse_response['stats'][0]['base_stat']}
        Pokemon.attack = {attack: parse_response['stats'][1]['base_stat']}
        Pokemon.defense = {defense: parse_response['stats'][2]['base_stat']}
        Pokemon.spc_attack = {spc_attack: parse_response['stats'][3]['base_stat']}
        Pokemon.spc_defense = {spc_defense: parse_response['stats'][4]['base_stat']}
        Pokemon.speed = {speed: parse_response['stats'][5]['base_stat']}
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
API.new.pokemon_roster

# names = API.new.get_pokemon
# puts names
#  pokedex = API.new
#  pokedex.pokemon_roster
