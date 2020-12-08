require "pry"
class Pokemon
    @@all = []
    #Methods to build
    # initialize
    attr_reader :name, :url, :number
    def initialize(name, url, number)
        @name = name
        @url = url
        @number = number
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
end
=begin 
:name, :type, :secondarytype, :evolution, :description
Pokemon.new(Pikachu, electric, Raiachu, electric mouse)
Pokemon.new(charmander, fire, charmeleon, fire lizard)
Pokemon.new(Rattatta, normal, raticate, mouse)
Pokemon.new(Sandshrew, ground, sandslash, shrew)
=end