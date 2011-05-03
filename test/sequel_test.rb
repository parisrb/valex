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
    assert_equal [:id, :name], users.attributes.keys.to_a

    assert_equal :id, users.attributes[:id].name
    assert_equal :integer, users.attributes[:id].type
    assert_equal 0, users.attributes[:id].validations.length

    assert_equal :name, users.attributes[:name].name
    assert_equal :string, users.attributes[:name].type
    assert_equal 1, users.attributes[:name].validations.length
    assert_equal Valex::Validations::Presence, users.attributes[:name].validations[0].class

    assert_equal 1, users.validations.length

    lusers = models[1]
    assert_equal "Luser", lusers.name
    assert_equal 2, lusers.attributes.length
    assert_equal 1, users.validations.length
  end

end
