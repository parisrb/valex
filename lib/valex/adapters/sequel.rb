require "sequel"

Sequel::Model.plugin :validation_helpers

class Sequel::Model

  def self.inherited k
    super
    if k.name
      # model classes without names are created when specifying a dataset when defining a model
      Valex::Adapters::SequelAdapter.add_model k
    end
  end

end

module Sequel::Plugins::ValidationHelpers::InstanceMethods

  def validates_presence(attr_name, opts={})
    Valex::Adapters::SequelAdapter.add_validation attr_name, Valex::Validations::Presence.new(attr_name)
  end

  def validates_exact_length(exact, atts, opts={})
  end

  def validates_format(with, atts, opts={})
  end

end

module Valex::Adapters
# Adapter for Sequel
  class SequelAdapter < Adapter

    def initialize parameters
      super parameters

      if parameters.has_key? "db"
        @db = parameters["db"]
        unless @db.is_a? Sequel::Database
          @db = Sequel.connect(@db)
        end
      else
        raise "No 'db' key in parameters : #{parameters}"
      end

    end

    # the loaded models
    @@valex_models = []


    def self.add_model model
      @@valex_models << model
    end

    # validation for the model currently being processed
    @@current_model_validations = []

    def self.add_validation attr_name, validation
      @@current_model_validations << validation
    end

    def process models_files_pattern

      @@valex_models = []

      Dir.glob(models_files_pattern) { |file| require file }

      # First read the schema info
      db_models = {}
      @db.tables.each do |table_sym|
        model = Valex::Model.new table_sym.to_s
        @db.schema(table_sym).each do |column|
          model.attributes << Valex::Attribute.new(column[0], column[1][:type])
        end
        db_models[table_sym] = model
      end

      # then get the validations from the models
      @@valex_models.collect do |model_class|
        # get the model using the table name
        model = db_models[model_class.dataset.opts[:from][0]]
        model.name = model_class.name

        instance = model_class.new
        @@current_model_validations = []
        instance.validate
        model.validations = @@current_model_validations
        model
      end
    end

  end
end