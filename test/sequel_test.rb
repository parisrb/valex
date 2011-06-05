require_relative 'helper_test'
require 'sequel'

module Valex::Test::Sequel

  class TestSequel < Test::Unit::TestCase

    ::SequelTestDB = Sequel.sqlite

    def test_know_sequel_adapter
      Valex::Valex.new :sequel, {'db' => ::SequelTestDB}
    end

    def test_validation_process
      valex = Valex::Valex.new :sequel, {'db' => ::SequelTestDB}
      assert_not_nil models = valex.process(HelperTest.model_path('sequel'))
      assert_equal 2, models.length

      users = models[0]
      assert_equal "Valex::Test::Sequel::User", users.name


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
      assert_equal "Valex::Test::Sequel::Luser", lusers.name
      assert_equal 2, lusers.attributes.length
      assert_equal 1, users.validations.length
    end
  end
end
