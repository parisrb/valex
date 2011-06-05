path = File.expand_path(File.dirname(__FILE__))
$:.unshift File.join path, '..', 'lib'
require_relative '../lib/valex'

require 'test/unit'

module Valex::Test

end

module HelperTest
  def self.model_path(model_file)
    File.expand_path(File.join(File.dirname(__FILE__), 'models', "#{model_file}.rb"))
  end
end
