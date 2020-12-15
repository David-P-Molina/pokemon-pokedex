require "pry"
class Team
    @@all = []
    def initialize
        save
    end
    
    def pokemons
        Pokemon.all.select {|pokemon| pokemon.team == self}
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
    
    def self.clear
        self.all.clear
    end
end