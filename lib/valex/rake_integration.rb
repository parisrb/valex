begin
  # Support Rake > 0.8.7
  require 'rake/dsl_definition'
  include Rake::DSL
rescue LoadError
end

module Valex

  class RakeTasks

    def self.install_tasks(opts = {})
      self.new(opts).install
    end

    def initialize(opts)
      @models_files_pattern = opts[:input]
      @adapter = opts[:adapter]
      @exporter = opts[:exporter] || :json
      @params = opts[:params]
      @output = opts[:output] || 'valex.json'
    end

    def install
      namespace :valex do
        desc "Export models"
        task 'export' do
          export_models
        end
      end
    end

    def export_models
      valex = ::Valex::Valex.new(@adapter, @params, @exporter)
      valex.process(@models_files_pattern)
      File.open(@output, 'w') do |f|
        f << valex.export
      end
    end
  end

end
