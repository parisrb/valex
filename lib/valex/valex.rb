module Valex

  # The main entry point
  class Valex

    # initialize with an adapter name or an adapter class
    def initialize(adapter, parameters = {}, exporter=:json)
      if adapter == :active_model
        require_relative "adapters/active_model"
        @adapter = Adapters::ActiveModelAdapter.new parameters
      elsif adapter == :sequel
        require_relative "adapters/sequel"
        @adapter = Adapters::SequelAdapter.new parameters
      else
        @adapter = adapter
      end
      if exporter == :json
        require_relative "exporters/json"
        @exporter = Exporters::JSON.new parameters
      elsif exporter == :jquery
          require_relative "exporters/jquery"
          @exporter = Exporters::JQuery.new parameters
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
