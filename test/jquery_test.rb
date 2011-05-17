require_relative 'helper_test'
require_relative '../lib/valex/exporters/jquery'

class JQueryTest < Test::Unit::TestCase

  def test_select_export
    models = []
    model = Valex::Model.new 'user'
    attribute = Valex::Attribute.new 'name', 'String'
    attribute.validations << Valex::Validations::Length.new({:minimum =>5})
    model.attributes[attribute.name] = attribute
    models << model

    assert_equal({"user"=>{:minlength=>5}}, Valex::Exporters::JQuery.new.process(models))
  end

end
