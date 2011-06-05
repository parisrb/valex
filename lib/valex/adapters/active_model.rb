require 'active_model'

module ActiveModel #:nodoc:

  # Monkeypatch to register the models
  module Validations
    def self.included(base)
      super.tap { Valex::Adapters::ActiveModelAdapter.add_model(base) }
    end
  end

end

module Valex::Adapters

  # Adapter for ActiveRecord
  class ActiveModelAdapter < Adapter

    def process(models_files_pattern)
      @@valex_models = []

      require_files(models_files_pattern)

      @@valex_models.map do |model_class|
        Valex::Model.new model_class.to_s
      end
    end
  end
  
end
