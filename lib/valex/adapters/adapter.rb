module Valex::Adapters # :nodoc:

  # Transform a set of models from an ORM to Valex models.
  # Derived for each ORM who should implement a
  # process(models_files_pattern) method
  class Adapter

    attr_reader :parameters

    def initialize(parameters)
      @parameters = parameters
    end

    # Require the files specified by a pattern
    def require_files(models_files_pattern)
      Dir.glob(models_files_pattern) { |file| require file }
    end

    # the loaded models
    @@valex_models = []

    # Add a Valex::Model
    def self.add_model model
      @@valex_models << model
    end

  end

end
