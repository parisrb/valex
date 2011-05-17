require_relative 'helper_test'
require 'active_model'

class TestActiveModel < Test::Unit::TestCase
  def test_validation_process
    valex = Valex::Valex.new :active_model
    assert_not_nil models = valex.process(HelperTest.model_path('active_model'))
    assert_equal 1, models.length

    users = models.first
    assert_equal "User", users.name

    assert_equal 2, users.attributes.length
    assert_equal [:id, :name], users.attributes.keys.to_a

    assert_equal Valex::Validations::Presence, users.attributes[:name].validations[0].class

    assert_equal 1, users.validations.length
  end

end
