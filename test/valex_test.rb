path = File.expand_path(File.dirname(__FILE__))
$:.unshift File.join path, "..", "lib"

require "valex"
require "test/unit"
 
class TestValex < Test::Unit::TestCase
 
  def test_adapter
    assert_not_nil Valex
    assert_not_nil Valex::Adapter
  end

  def test_model
    assert_not_nil Valex::Model
  end

  def test_validations
    assert_not_nil Valex::Validations
  end

  def test_validation_presence
    assert_not_nil Valex::Validations::Presence
  end
end
