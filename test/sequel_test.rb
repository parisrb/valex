require_relative 'helper_test'

class TestSequel < Test::Unit::TestCase

  def test_know_sequel_adapter
    Valex::Valex.new :sequel
  end

  #  valex.process File.dirname(__FILE__) + 'models/sequel'


end
