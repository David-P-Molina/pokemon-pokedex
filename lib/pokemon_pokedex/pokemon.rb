require "pry"
class Pokemon
    @@all = []
    attr_reader :name, :url, :number, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed
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
        pokemon.save
        pokemon
    end
    def self.find_by_number(number)
        all.detect{|poke| poke.number == number}
    end
    # find or create by name ##is this needed
    def get_pokemon_by_number#Uses second parse method to retrieve pokemon stats## add description retrieval
    end
    def get_pokemon_list
    #iterator that instantiates eaach new pokemon that is retrieved from pokemon list
    end
    # findbynumber
    # findbytype
   # binding.pry
end
