# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'scryfall'
  s.version     = '0.3.1'
  s.date        = '2018-09-20'
  s.summary     = 'A gem made to contact Scryfall API'
  s.description = 'A simple way to connect with Scryfall API and get MTG Card info easily'
  s.authors     = ['João Lucas']
  s.email       = 'jlcarruda3@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.extra_rdoc_files = ['README.md']
  s.homepage = 'https://github.com/jlcarruda/scryfall-rails'
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.7.0'

  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rubocop'
  s.add_runtime_dependency 'http', ['~> 4']
  s.add_runtime_dependency 'resolv-replace', ['~> 0.1.1']
end
