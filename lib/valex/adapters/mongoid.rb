require 'mongoid'

module Valex::Adapters
# Adapter for Mongoid
  class MongoidAdapter < Adapter

    def process models_files_pattern
      require_files(models_files_pattern)
    end
  end
end
