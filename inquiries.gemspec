# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inquiries/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "inquiries"
  gem.version       = Inquiries::Rails::VERSION
  gem.authors       = ["John Colvin"]
  gem.email         = ["colvin.john@gmail.com"]
  gem.description   = "Extracted from the refinerycms-inquiries gem. Records inquiries in the DB and sends notifications via email"
  gem.summary       = "Records inquiries and sends email notifications"
  gem.homepage      = "http://github.com/JohnColvin/inquiries"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  s.add_dependency 'filters_spam', '~> 0.2'
  s.add_dependency 'actionmailer'
end
