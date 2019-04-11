Gem::Specification.new do |s|
  s.name        = 'scryfall'
  s.version     = '0.1.8'
  s.date        = '2018-09-20'
  s.summary     = "A gem made to contact Scryfall API"
  s.description = "A simple way to connect with Scryfall API and get MTG Card info easily"
  s.authors     = ["João Lucas"]
  s.email       = 'jlcarruda3@gmail.com'
  s.files       = ["lib/scryfall/cards.rb", "lib/scryfall/error_handler.rb", "lib/scryfall/errors.rb", "lib/scryfall/api.rb", "lib/scryfall/base.rb"]
  s.extra_rdoc_files = ['README.md']
  s.homepage    = 'https://github.com/jlcarruda/scryfall-rails'
  s.license       = 'MIT'

  s.add_development_dependency "rspec", "~> 3.2"
  s.add_development_dependency "pry"
  s.add_runtime_dependency "http", ["~> 3"]
end
