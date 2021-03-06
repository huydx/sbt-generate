# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sbt/template/version'

Gem::Specification.new do |spec|
  spec.name          = "sbt-template"
  spec.version       = Sbt::Template::VERSION
  spec.authors       = ["huydx"]
  spec.summary       = %q{template generator for sbt}
  spec.description   = %q{template generator for sbt}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.1.0'


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "activesupport", "~>4.0"
  spec.add_runtime_dependency "thor"
end
