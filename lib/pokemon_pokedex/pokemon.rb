require "pry"
class Pokemon
    @@all = []
    attr_accessor :name, :url, :number, :description, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed
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
    def self.clear
        self.class.all.clear 
    end
    def self.create(name, url)
        pokemon = new(name, url)
        pokemon.number = @@all.length + 1
        pokemon.save
        pokemon
    end


    def get_pokemon_description#Uses second parse method to retrieve pokemon stats## add description retrieval
      #  self.find_by_number
        @description = description
    end
    def self.find_by_number(number) #connect and use number and string interpolate it into url to search for info
        all.detect{|poke| poke.number == number}
        #pokemon.number
    end


    def self.find_by_url(url) 
        all.detect{|poke| poke.url == url}
    end
    def get_pokemon_stats#Uses second parse method to retrieve pokemon stats## add description retrieval
        pokemon_instance = self.find_url
    end

end

