require_relative 'helper_test'

class TestSequel < Test::Unit::TestCase

  def test_know_sequel_adapter
    Valex::Valex.new :sequel
  end

  def test_validation
    valex = Valex::Valex.new :sequel
    model_path = File.expand_path(File.join(File.dirname(__FILE__), 'models', 'sequel.rb'))
    assert_not_nil models = valex.process(model_path)
    assert_equal 1, models.length
    assert_equal "User", models.first.name
  end

end
