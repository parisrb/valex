require_relative 'helper_test'
 
class TestValex < Test::Unit::TestCase

  def test_adapter
    assert_not_nil Valex
    assert_not_nil Valex::Adapters::Adapter
  end

  def test_model
    assert_not_nil Valex::Model
  end

  def test_validations
    assert_not_nil Valex::Validations
  end

  def test_validation_format
    assert_not_nil Valex::Validations::Format
  end

  def test_validation_length
    assert_not_nil Valex::Validations::Length
  end

  def test_validation_numericality
    assert_not_nil Valex::Validations::Numericality
  end

  def test_validation_presence
    assert_not_nil Valex::Validations::Presence
  end

  def test_validation_unique
    assert_not_nil Valex::Validations::Unique
  end

end
