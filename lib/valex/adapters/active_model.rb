# Adapter for ActiveRecord
require 'active_model'
module ActiveModel::Validations
  def self.included base
    super.tap { Valex::Adapters::ActiveModelAdapter.add_model(base) }
  end
end

module Valex::Adapters
  class ActiveModelAdapter < Adapter

    def process models_files_pattern
      @@valex_models = []

      require_files(models_files_pattern)

      @@valex_models.map { |model_class|
        Valex::Model.new model_class.to_s
      }
    end

  end
end
