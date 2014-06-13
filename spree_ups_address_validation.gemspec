# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_ups_address_validation'
  s.version     = '2.2.2'
  s.summary     = 'Validate your spree shipping addresses'
  s.description = 'Validate your spree shipping addresses'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Brady Somerville'
  s.email     = 'brady.somerville@gmail.com'
  s.homepage  = 'http://github.com/nicedawg'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.2'
  s.add_dependency 'address_validator'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
