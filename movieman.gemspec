# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movieman/version'

Gem::Specification.new do |gem|
  gem.name          = "movieman"
  gem.version       = Movieman::VERSION
  gem.authors       = ["Oto Brglez"]
  gem.email         = ["otobrglez@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "multi_json"
  gem.add_dependency "multi_xml"
	gem.add_dependency "faraday"
  gem.add_dependency "typhoeus"
	gem.add_dependency "oj"
  gem.add_dependency "faraday_middleware"
  gem.add_dependency "faraday_middleware-parse_oj"

	gem.add_development_dependency "webmock", "<= 1.9"
	%w{rb-fsevent rspec vcr guard guard-rspec guard-spork spork}.each do |g|
		gem.add_development_dependency g
	end

end
