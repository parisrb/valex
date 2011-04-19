require "sequel"
Sequel::Model.plugin :validation_helpers

module Sequel

  class Model

    # contain the list of loaded models
    VALEX_MODELS_LIST = []

    def self.inherited k
      super
      VALEX_MODELS_LIST << k
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

      def process models_files_pattern
        Dir.glob(models_files_pattern) {|file| require file}
        Sequel::Model::VALEX_MODELS_LIST.collect do |model_class|
          model = Model.new(model_class.name)
          instance = model_class.new
          instance.validate
          model
        end
      end

    end

  end
end
