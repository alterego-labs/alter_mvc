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

  spec.add_development_dependency "bundler",        "~> 1.3"
  spec.add_development_dependency "rake",           ">= 10.3.0"
  spec.add_development_dependency "activesupport",  "4.0.4"
  spec.add_development_dependency "activerecord",   "4.0.4"
  spec.add_development_dependency "actionpack",     "4.0.4"
  spec.add_development_dependency "activemodel",    "4.0.4"
  spec.add_development_dependency "rails",          "4.0.4"
  spec.add_development_dependency "rails-i18n"
  spec.add_development_dependency "activerecord-nulldb-adapter", '0.3.1'

  spec.add_development_dependency "rspec",          "3.0.0"
  spec.add_development_dependency "rspec-given",    "3.5.4"
  spec.add_development_dependency "rspec-its",      "1.0.1"
  spec.add_development_dependency "pry-nav",        "0.2.3"
  spec.add_development_dependency "codeclimate-test-reporter",        "0.4.0"
end
