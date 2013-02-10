# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_support/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec_support"
  gem.version       = RspecSupport::VERSION
  gem.authors       = ["Gabe Berke-Williams"]
  gem.email         = ["gabe@thoughtbot.com"]
  gem.description   = %q{Helpful bits and bobs}
  gem.summary       = %q{Instead of copying and pasting, just require this gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
