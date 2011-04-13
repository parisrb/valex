# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "valex/version"

Gem::Specification.new do |s|
  s.name        = "Valex"
  s.version     = Valex::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paris.rb team"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = "https://github.com/parisrb/valex"
  s.summary     = "Export validations from ORMs to javascript to avoid code duplication"
  s.description = "Export validations from ORMs to javascript to avoid code duplication"

  s.rubyforge_project = "valex"
  s.add_runtime_dependency "json"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
