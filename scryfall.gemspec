Gem::Specification.new do |s|
  s.name        = 'scryfall'
  s.version     = '0.0.5'
  s.date        = '2018-09-20'
  s.summary     = "Scryfall"
  s.description = "A simple way to connect with Scryfall API"
  s.authors     = ["João Lucas"]
  s.email       = 'jlcarruda3@gmail.com'
  s.files       = ["lib/scryfall.rb"]
  s.homepage    =
    'http://rubygems.org/gems/scryfall'
  s.license       = 'MIT'
  s.add_runtime_dependency "http", 
    ["~> 3"]
end