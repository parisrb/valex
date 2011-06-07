module Valex

  # The main entry point
  class Valex

    # Initialize
    # adapter:: the adapter name or class
    # parameters:: paramaters for the adapter and exporter
    # exporter:: the exporter name or class, default is :json
    def initialize(adapter, parameters = {}, exporter=:json)
      if adapter == :active_model
        require_relative 'adapters/active_model'
        @adapter = Adapters::ActiveModelAdapter.new parameters
      elsif adapter == :sequel
        require_relative 'adapters/sequel'
        @adapter = Adapters::SequelAdapter.new parameters
      else
        @adapter = adapter
      end
      if exporter == :json
        require_relative 'exporters/json'
        @exporter = Exporters::JSON.new parameters
      elsif exporter == :jquery
        require_relative 'exporters/jquery'
        @exporter = Exporters::JQuery.new parameters
      else
        @exporter = exporter
      end
    end

    # Process the models indicated by a file pattern
    def process(models_files_pattern)
      @models = @adapter.process models_files_pattern
    end

    # Export the models
    def export
      @exporter.process @models
    end
  end

end
