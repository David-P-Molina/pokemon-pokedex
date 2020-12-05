require "pry"
require "open-uri"
require "json"
require "net/http"
class API
    URL = 
    def self.get_pokemon(URL)
        uri-URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        pokemon = JSON.parse(response.body)
        #pokemon.each do |poke|
    end
end