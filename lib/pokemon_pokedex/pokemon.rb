require "pry"
class Pokemon
    @@all = []
    #Methods to build
    # initialize
    attr_reader :name, :url, :number, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed
    def initialize(name, url)
        @name = name
        @url = url
        @number = @@all.length + 1
        save
    end
    def save# save
        self.class.all << self
    end
    def self.all    # self.all
        @@all
    end
    def self.clear# self.clear is this needed?
        self.class.all.clear 
    end
    # self.create
    # find_by_name
    # find or create by name
    # findbynumber
    # findbytype
   # binding.pry
end
=begin 
:name, :type, :secondarytype, :evolution, :description
Pokemon.new(Rattatta, normal, raticate, mouse)
Pokemon.new(Sandshrew, ground, sandslash, shrew)
=end
p Pokemon.new("charmander", "fire" )
 p Pokemon.new("Pikachu", "electric")
 Pokemon.all