require "pry"
class Pokemon
    @@all = []
    #Methods to build
    # initialize
    def self.all    # self.all
        @@all
    end
    def self.clear
       @@all.clear 
    end# self.clear is this needed?
    def save# save
        @@all << self
    end
    # self.create
    # findbyname
    # find or create by name
    # findbynumber
    # findbytype
    
end