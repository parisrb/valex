module Valex

  # The main entry point
  class Valex

    KNOWN_ADAPTERS = {
        'rails' => {:file => 'adapters/active_model', :class => 'ActiveModelAdapter'},
        'active_model' => {:file => 'adapters/active_model', :class => 'ActiveModelAdapter'},
        'sequel' => {:file => 'adapters/sequel', :class => 'SequelAdapter'},
        'mongoid' => {:file => 'adapters/mongoid', :class => 'MongoidAdapter'}}

    KNOWN_EXPORTERS = {
        'json' => {:file => 'exporters/json', :class => 'JSONExporter'},
        'jquery' => {:file => 'exporters/jquery', :class => 'JQueryExporter'}}

    # Initialize
    # adapter:: the adapter name or an adapter instance
    # parameters:: paramaters for the adapter and exporter
    # exporter:: the exporter name or an exporter instance, default is :json
    def initialize(adapter, parameters = {}, exporter = 'json')
      if known_adapter = KNOWN_ADAPTERS[adapter]
        require_relative known_adapter[:file]
        @adapter = Adapters.const_get(known_adapter[:class]).new parameters
      elsif adapter.respond_to? :process
        @adapter = adapter
      else
        raise "Unknown adapter, possible names are '#{KNOWN_ADAPTERS.keys.join("', '")}'"
      end
      if known_exporter = KNOWN_EXPORTERS[exporter]
        require_relative known_exporter[:file]
        @exporter = Exporters.const_get(known_exporter[:class]).new parameters
      elsif exporter.respond_to? :process
        #we directly use an exporter
        @exporter = exporter
      else
        raise "Unknown exporter, possible names are '#{KNOWN_EXPORTERS.keys.join("', '")}'"
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
