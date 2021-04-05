require "pry"
class Pokemon
    @@all = []
    attr_accessor :name, :url, :number, :description, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed, :team
    def initialize(name, url, number = nil, description = nil, height = nil, weight = nil, type = nil, hp = nil, attacl =nil, defense = nil, spc_attack = nil, spc_defense = nil, speed = nil, team = nil)
        self.name = name
        self.url = url
        self.number = @@all.length + 1
        self.description = description
        self.height = height
        self.weight = weight
        self.type = type
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.spc_attack = spc_attack
        self.spc_defense = spc_defense
        self.speed = speed
        self.team = team
        save
    end
    def self.find_all_type(type)
        all.select{|poke| poke.type == type}
    end
    def save
        self.class.all << self
    end
    def self.all 
        @@all
    end
    # def self.clear
    #     self.class.all.clear 
    # end
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

