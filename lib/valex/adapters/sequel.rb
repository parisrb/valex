require 'sequel'

Sequel::Model.plugin :validation_helpers

module Sequel

  # Monkeypatch to register the models
  class Model

    def self.inherited(k)
      super
      # model classes without names are created when specifying a table name when defining a model
      # so we ignore them
      if k.name
        Valex::Adapters::SequelAdapter.add_model k
      end
    end

  end

  module Plugins::ValidationHelpers

    # Monkeypatch to register the validations
    module InstanceMethods

      remove_method :validates_presence

      def validates_presence(attr_name, opts={})
        add_validation attr_name, Valex::Validations::Presence.new
      end

      remove_method :validates_exact_length

      def validates_exact_length(exact, atts, opts={})
        atts.each do |att|
          add_validation att, Valex::Validations::Length.new({:maximum => exact, :minimum => exact})
        end
      end

      remove_method :validates_format

      def validates_format(with, atts, opts={})
        atts.each do |att|
          add_validation att, Valex::Validations::Format.new({:format => with})
        end
      end

      remove_method :validates_unique

      def validates_unique(*atts)
        atts.each do |att|
          add_validation att, Valex::Validations::Unique.new
        end
      end

      private

      def add_validation(attr_name, validation)
        Valex::Adapters::SequelAdapter.add_validation attr_name, validation
      end
    end
  end
end

module Valex::Adapters
  # Adapter for Sequel
  class SequelAdapter < Adapter

    def initialize(parameters)
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

    # validation for the model currently being processed
    @@current_model_validations = {}

    # add a Validation for the current model
    def self.add_validation(attr_name, validation)
      @@current_model_validations[attr_name] << validation
    end

    def process(models_files_pattern)
      @@valex_models = []

      require_files(models_files_pattern)

      # First read the schema info to create the attributes
      models = {}
      @db.tables.each do |table_sym|
        model = Valex::Model.new table_sym.to_s
        @db.schema(table_sym).each do |column|
          model.attributes[column[0]] = Valex::Attribute.new(column[0], column[1][:type])
        end
        models[table_sym] = model
      end

      # then get the validations from the models
      @@valex_models.collect do |model_class|
        # get the model using the table name
        model = models[model_class.dataset.opts[:from][0]]
        model.name = model_class.name

        @@current_model_validations = Hash.new { |hash, key| hash[key] = [] }
        instance = model_class.new
        instance.validate
        @@current_model_validations.each_pair do |attr_name, validations|
          model.validations.concat(validations)
          attribute = model.attributes[attr_name]
          attribute.validations.concat(validations)
          validations.each {|v| v.attribute = attribute }
        end
        model
      end
    end

  end
end
