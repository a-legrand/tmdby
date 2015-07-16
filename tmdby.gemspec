# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tmdby/version'

Gem::Specification.new do |spec|
  spec.name          = "tmdby"
  spec.version       = Tmdby::VERSION
  spec.authors       = ["Aurélien Le Grand"]
  spec.email         = ["gnitg@yahoo.fr"]
  spec.summary       = "A Ruby wrapper for the TMDB API (http://docs.themoviedb.apiary.io/)"
  spec.description   = %q{Full integration of all the TMDB API}
  spec.homepage      = "https://github.com/a-legrand/tmdby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
