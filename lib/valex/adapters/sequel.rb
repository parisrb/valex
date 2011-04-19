require "sequel"
Sequel::Model.plugin :validation_helpers

class Sequel::Model

  def self.inherited k
    super
    Valex::Adapters::SequelAdapter.add_model k
  end

end

module Sequel::Plugins::ValidationHelpers::InstanceMethods

  def validates_presence(attr_name, opts={})
    validation = Valex::Validations::Presence.new
    Valex::Adapters::SequelAdapter.add_validation attr_name, validation
  end

  def validates_exact_length(exact, atts, opts={})
  end

  def validates_format(with, atts, opts={})
  end

end

module Valex::Adapters
# Adapter for Sequel
  class SequelAdapter < Adapter

    # the loaded models
    @@valex_models = []

    def self.add_model model
      @@valex_models << model
    end

    # validation for the model currently being processed
    @@current_model_validations = {}
    @@current_model_attributes = {}

    def self.add_validation attr_name, validation
      @@current_model_validations[attr_name] ||= []
      @@current_model_validations[attr_name].push validation
    end

    def self.add_attribute attr_name, type
      @@current_model_attributes[attr_name] = type
    end

    def process models_files_pattern
      Dir.glob(models_files_pattern) { |file| require file }
      @@valex_models.collect do |model_class|
        @@current_model_validations = {}
        @@current_model_attributes = {}
        model = Valex::Model.new(model_class.name)
        instance = model_class.new
        instance.validate
        model.validations = @@current_model_validations
        @@current_model_attributes.each do |attr_name, type|
          model.attributes << Valex::Attribute.new(attr_name, type)
        end
        model
      end
    end

  end
end