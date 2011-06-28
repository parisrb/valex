require 'bundler'
require 'rake'
require 'rake/testtask'
require 'yard'

Bundler::GemHelper.install_tasks

task :default => [:test]

desc 'Run tests'
Rake::TestTask.new('test') { |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  t.warning = true
}

YARD::Rake::YardocTask.new
