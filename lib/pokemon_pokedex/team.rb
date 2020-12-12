require "pry"
class Team
    attr_accessor :pokemon
    @@all = []
    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
    
    def self.clear
        @@all.clear
    end
end