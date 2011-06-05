# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'valex/version'

Gem::Specification.new do |s|
  s.name        = "Valex"
  s.version     = Valex::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paris.rb team"]
  s.email       = "paris.code.rb@librelist.com"
  s.homepage    = "https://github.com/parisrb/valex"
  s.summary     = "Export ORMs validations to js"
  s.description = "Parse validations from several ruby ORMs and export them in javascript to avoid code duplication between client and server"
  s.license     = 'MIT'

  s.rubyforge_project = "valex"
  s.add_runtime_dependency "json"
  s.add_development_dependency "sequel", '>= 3.21.0'
  s.add_development_dependency "sqlite3", '>= 1.3.3'
  s.add_development_dependency "mongoid", '2.0.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
