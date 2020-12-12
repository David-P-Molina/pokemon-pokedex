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
    def self.pokemon_description(number) #description ##i should be set to Pokemon.number
        # number = Pokemon.find_by_number 
        pokemon = Pokemon.find_by_number(number)
        url = "https://pokeapi.co/api/v2/pokemon-species/#{number}" #use string interpolation
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
         response.body
         description_list = JSON.parse(response.body)
         pokemon.description = description_list['flavor_text_entries'][1]['flavor_text'].gsub(/[^A-Za-z]/, ' ') 
         pokemon
     end

    #stat
    def self.select_stats(url)#types, name, height, weight, stats 
        uri = URI.parse(url) #converts and parses out URL info
        response = Net::HTTP.get_response(uri) #uses builtin method to recieve a GET request that is a Net::HTTPOOK object
        response.body
    end
    def self.pokemon_stats(url)    
        parse_response = JSON.parse(self.select_stats(url))
        pokemon = Pokemon.find_by_url(url)
        pokemon.height = parse_response['height']
        pokemon.weight = parse_response['weight']
        pokemon.type = parse_response['types'][0]['type']['name']
        pokemon.hp = parse_response['stats'][0]['base_stat']
        pokemon.attack = parse_response['stats'][1]['base_stat']
        pokemon.defense = parse_response['stats'][2]['base_stat']
        pokemon.spc_attack = parse_response['stats'][3]['base_stat']
        pokemon.spc_defense = parse_response['stats'][4]['base_stat']
        pokemon.speed = parse_response['stats'][5]['base_stat']
        pokemon
    end
end
