require "pry"
class Pokemon
    @@all = []
    #Methods to build
    # initialize
    attr_accessor :name, :type, :secondarytype, :evolution, :description
    attr_writer
    attr_reader
    def initialize(name, type, secondarytype = nil, evolution = nil, description)
        @name = name
        @type = type
        @secondarytype = secondarytype
        @evolution = evolution
        @description = description
        save
    end
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