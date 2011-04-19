path = File.expand_path(File.dirname(__FILE__))
$:.unshift File.join path, "..", "lib"
require_relative '../lib/valex'

require "valex"
require "test/unit"
