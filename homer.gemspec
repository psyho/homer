# -*- encoding: utf-8 -*-
require File.expand_path('../lib/homer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Pohorecki"]
  gem.email         = ["adam@pohorecki.pl"]
  gem.description   = %q{A commandline utility to rename tv show episodes}
  gem.summary       = %q{A commandline utility to rename tv show episodes}
  gem.homepage      = "http://github.com/psyho/homer.rb"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "homer"
  gem.require_paths = ["lib"]
  gem.version       = Homer::VERSION

  gem.add_dependency 'dependor'
  gem.add_dependency 'tvdb_party'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'

  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-ctags-bundler'
  gem.add_development_dependency 'libnotify'
  gem.add_development_dependency 'growl'
end

