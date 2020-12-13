require "pry"
class Pokemon
    @@all = []
    attr_accessor :name, :url, :number, :description, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed
    def initialize(name, url)
        @name = name
        @url = url
        @number = @@all.length + 1
        @description = description
        @height = height
        @weight = weight
        @type = type
        @hp = hp
        @attack = attack
        @defense = defense
        @spc_attack = spc_attack
        @spc_defense = spc_defense
        @speed = speed


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
    def self.find_by_number(number) #connect and use number and string interpolate it into url to search for info
        all.detect{|poke| poke.number == number}
        #pokemon.number
    end
    def self.find_by_url(url) 
        all.detect{|poke| poke.url == url}
    end
end

