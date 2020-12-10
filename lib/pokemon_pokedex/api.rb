#require_relative './pokemon'
class API
    #list
    def self.get_pokemon_list
        url = "https://pokeapi.co/api/v2/pokemon?limit=151" #the main information/ 
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
    def self.pokemon_roster
        pokemon_list = JSON.parse(self.get_pokemon_list)
        pokemon_list['results'].collect do |hash|
            Pokemon.new(hash["name"], hash["url"])
        end
    end

    #description
    def self.select_description(number) #description ##i should be set to Pokemon.number
        
        url = "https://pokeapi.co/api/v2/pokemon-species/#{number}/" #use string interpolation
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
   end
    def self.pokemon_description
        description_list = JSON.parse(self.select_description)
        description_list['flavor_text_entries'][0]['flavor_text'] #example"A strange seed was\nplanted on its\nback at birth.
                #\fThe plant sprouts\nand grows with\nthis POKéMON." 
  
    end
    #stat
    def self.select_stats(url)#types, name, height, weight, stats 
        binding.pry
        
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        parse_response = JSON.parse(response.body)
        #Pokemon.name = {name: parse_response['species']['name']}
        Pokemon.height = {height: parse_response['height']}
        Pokemon.weight = {weight: parse_response['weight']}
        Pokemon.type = {type: parse_response['types'][0]['type']['name']}
        Pokemon.hp = {hp: parse_response['stats'][0]['base_stat']}
        Pokemon.attack = {attack: parse_response['stats'][1]['base_stat']}
        Pokemon.defense = {defense: parse_response['stats'][2]['base_stat']}
        Pokemon.spc_attack = {spc_attack: parse_response['stats'][3]['base_stat']}
        Pokemon.spc_defense = {spc_defense: parse_response['stats'][4]['base_stat']}
        Pokemon.speed = {speed: parse_response['stats'][5]['base_stat']}
        #alternate option? Pokemon.speed = parse_response['stats'][5]['base_stat']
    end
end
API.new.pokemon_description(3)

# names = API.new.get_pokemon
# puts names
#  pokedex = API.new
#  pokedex.pokemon_roster
