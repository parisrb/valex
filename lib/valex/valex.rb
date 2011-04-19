module Valex

  # The main entry point
  class Valex

    # initialize with an adapter name or an adapter class
    def initialize(adapter)
      if adapter == :active_model
        require_relative "adapters/active_model"
        @adapter = Adapters::ActiveModelAdapter.new
      elsif adapter == :sequel
        require_relative "adapters/sequel"
        @adapter = Adapters::SequelAdapter.new
      else
        @adapter = adapter
      end
    end

    def process models_files_pattern
      models = @adapter.process models_files_pattern
    end

  end

end
