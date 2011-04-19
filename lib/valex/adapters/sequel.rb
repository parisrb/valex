require "sequel"
Sequel::Model.plugin :validation_helpers

module Sequel

  class Model

    def self.inherited k
      super
      Valex::Adapters::SequelAdapter::VALEX_MODELS_LIST << k
    end

  end

end

module Sequel

  module Plugins

    module ValidationHelpers

      # here add the hacks
      
    end

  end

end

module Valex

  module Adapters

    # Adapter for Sequel
    class SequelAdapter < Adapter

    # contain the list of loaded models
    VALEX_MODELS_LIST = []

      def process models_files_pattern
        Dir.glob(models_files_pattern) {|file| require file}
          VALEX_MODELS_LIST.collect do |model_class|
          model = Model.new(model_class.name)
          instance = model_class.new
          instance.validate
          model
        end
      end

    end

  end
end
