require_relative 'lib/pokemon_pokedex/version'

Gem::Specification.new do |spec|
  spec.name          = "pokemon_pokedex"
  spec.version       = PokemonPokedex::VERSION
  spec.authors       = ["David Moina"]
  spec.email         = ["davemolina777@gmail.com"]

  spec.summary       = " Kanto Region Pokedex and Team Builder"
  spec.description   = " Ruby Gem for learning about the Original 151 Pokemon and creating your Dream Team."
  spec.homepage      = "https://github.com/David-P-Molina/pokemon-pokedex"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/David-P-Molina/pokemon-pokedex"

  
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "colorize"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
end
