require '../../valex'

module Valex

  module Adapters

    # Adapter for Sequel
    class SequelAdapter < Adapter

      # Initialize the adapter, add a set of hooks to sequel to intercept the validations when the models are loaded
      def initialize

      end

      def process models_files_pattern
        []
      end

    end

  end
end
