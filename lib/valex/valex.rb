module Valex

  # The main entry point
  class Valex

    # initialize with an adapter name or an adapter class
    def initialize(adapter, exporter=:json)
      if adapter == :active_model
        require_relative "adapters/active_model"
        @adapter = Adapters::ActiveModelAdapter.new
      elsif adapter == :sequel
        require_relative "adapters/sequel"
        @adapter = Adapters::SequelAdapter.new
      else
        @adapter = adapter
      end
      if exporter == :json
        require_relative "exporters/json"
        @exporter = Exporters::JSON.new
      else
        @exporter = exporter
      end
    end

    def process models_files_pattern
      @models = @adapter.process models_files_pattern
    end

    def export
      @exporter.process @models
    end
  end

end
