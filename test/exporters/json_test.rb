require_relative '../test_helper'
require_relative '../../lib/valex/exporters/json'

class Valex::Test::JQueryTest < Test::Unit::TestCase

  def test_select_export
    models = []
    model = Valex::Model.new 'user'
    attribute = Valex::Attribute.new 'name', 'String'
    attribute.validations << Valex::Validations::Length.new({:minimum =>5})
    attribute.validations << Valex::Validations::Presence.new
    model.attributes[attribute.name] = attribute
    models << model

    assert_equal(
        [{:name=>"user",
          :attributes=> {
              "name"=> [{:type=>"String",
                         :validations=>
                             [{:type=>"length", :minimum=>5},
                              {:type=>"presence"}],
                        }]}}],
        Valex::Exporters::JSONExporter.new.process_to_ruby(models))
  end

end
