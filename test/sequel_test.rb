require_relative 'helper_test'
require 'sequel'

class TestSequel < Test::Unit::TestCase

  DB = Sequel.sqlite

  def test_know_sequel_adapter
    Valex::Valex.new :sequel, {'db' => DB}
  end

  def test_validation_process
    valex = Valex::Valex.new :sequel, {'db' => DB}
    model_path = File.expand_path(File.join(File.dirname(__FILE__), 'models', 'sequel.rb'))
    assert_not_nil models = valex.process(model_path)
    assert_equal 2, models.length

    users = models[0]
    assert_equal "User", users.name
    assert_equal 2, users.attributes.length
    assert_equal 1, users.validations.length

    lusers = models[1]
    assert_equal "Luser", lusers.name
    assert_equal 2, lusers.attributes.length
    assert_equal 1, users.validations.length
  end

  def test_validation_export
    valex = Valex::Valex.new :sequel, {'db' => DB}
#    model_path = File.expand_path(File.join(File.dirname(__FILE__), 'models', 'sequel.rb'))
#    assert_not_nil models = valex.process(model_path)
#    assert_not_nil models = valex.export
  end
end
