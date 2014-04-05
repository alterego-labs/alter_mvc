# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alter_mvc/version'

Gem::Specification.new do |spec|
  spec.name          = "alter_mvc"
  spec.version       = AlterMvc::VERSION
  spec.authors       = ["Sergey Gernyak"]
  spec.email         = ["sergeg1990@gmail.com"]
  spec.description   = %q{Extending MVC concept by some useful modules}
  spec.summary       = %q{Trying to fix some very known problems using MVC concept in Rails}
  spec.homepage      = "https://github.com/alterego-labs/alter_mvc"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "responders", "1.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "activerecord"
end
