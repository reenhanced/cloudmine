# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudmine/version'

Gem::Specification.new do |gem|
  gem.name          = "cloudmine"
  gem.version       = Cloudmine::VERSION
  gem.authors       = ["Nicholas Hance"]
  gem.email         = ["nhance@reenhanced.com"]
  gem.description   = %q{Cloudmine API wrapper}
  gem.summary       = %q{Cloudmine API wrapper}
  gem.homepage      = "http://github.com/reenhanced/cloudmine"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('httparty')
  gem.add_dependency('json')
end
