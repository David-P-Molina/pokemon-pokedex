require "pry"
class Pokemon
    @@all = []
    attr_accessor :name, :url, :number, :description, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed, :team
    def initialize(name, url, number = nil, description = nil, height = nil, weight = nil, type = nil, hp = nil, attacl =nil, defense = nil, spc_attack = nil, spc_defense = nil, speed = nil, team = nil)
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
        @team = team
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
    def self.find_by_number(number) 
        all.detect{|poke| poke.number == number}
    end
    def self.find_by_url(url) 
        all.detect{|poke| poke.url == url}
    end
end

