require "pry"
class Pokemon
    @@all = []
    attr_accessor :name, :url, :number, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed
    def initialize(name, url)
        @name = name
        @url = url
        @number = @@all.length + 1
        save
    end
    def save
        self.class.all << self
    end
    def self.all 
        @@all
    end
    def self.clear# self.clear is this needed?
        self.class.all.clear 
    end
    def self.create(name, url)
        pokemon = new(name, url)

        pokemon.number = @@all.length + 1
        pokemon.save
        pokemon
    end
    def self.find_by_number(number)
    binding.pry
        all.detect{|poke| poke.number == number}
        pokemon.url #connect to api
    end
    
    def get_pokemon_stats#Uses second parse method to retrieve pokemon stats## add description retrieval
    binding.pry    pokemon_instance = self.find_by_number
        @height = height #how do i connect this with method in api to assign variables to each other? 
        @weight = weight#in API class would i do Pokemon.height = {height: parse_response['height']}
        @type = type#did i just add a bunch of attr_writers again
        @hp = hp
        @attack = attack
        @defense = defense
        @spc_attack = spc_attack
        @spc_defense = spc_defense
        @speed = speed
      #  or 
      #  API.select_stats
    end
    def get_pokemon_description#Uses second parse method to retrieve pokemon stats## add description retrieval
        self.find_by_number
        @description = description
    end

end
