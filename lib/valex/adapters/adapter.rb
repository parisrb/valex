module Valex::Adapters

  # Transform a set of models from an ORM to Valex models.
  class Adapter

    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
    end

    def require_files(models_files_pattern)
      Dir.glob(models_files_pattern) { |file| require file }
    end

    # the loaded models
    @@valex_models = []

    def self.add_model model
      @@valex_models << model
    end

  end

end
