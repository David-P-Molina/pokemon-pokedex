#!/usr/bin/env ruby
require "pry"
require "open-uri"
require "net/http"
require "json"
require "awesome_print"
require "tty-table"
require "colorize"

require_relative '../lib/pokemon_pokedex/pokemon'
require_relative '../lib/pokemon_pokedex/api'
require_relative '../lib/pokemon_pokedex/cli'
require_relative '../lib/pokemon_pokedex/team'
#require_relative '../lib/pokemon_pokedex/table'
#require_relative '../lib/pokemon_pokedex/version'