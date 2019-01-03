# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'echo_link/version'

Gem::Specification.new do |spec|
  spec.name          = "echo_link"
  spec.version       = EchoLink::VERSION
  spec.authors       = ["Kevin Elliott"]
  spec.email         = ["kevin@welikeinc.com"]
  spec.description   = %q{Ruby gem to interact with the EchoLink, such as retrieving link status.}
  spec.summary       = %q{Ruby gem to interact with the EchoLink.}
  spec.homepage      = "http://github.com/kevinelliott/echo_link"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'curb'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake"
end
