#!/usr/bin/env ruby
require "pry"
require "open-uri"
require "net/http"
require "json"
require "awesome_print"
#require api gems here

require_relative '../lib/pokemon_pokedex/pokemon'
require_relative '../lib/pokemon_pokedex/api'
require_relative '../lib/pokemon_pokedex/table'
require_relative '../lib/pokemon_pokedex/concerns/cli_module'
require_relative '../lib/pokemon_pokedex/cli'
require_relative '../lib/pokemon_pokedex/team'
#require_relative '../lib/pokemon_pokedex/version'