require "mongoid"

module Valex::Adapters
# Adapter for Mongoid
  class MongoidAdapter < Adapter

    def process models_files_pattern
      Dir.glob(models_files_pattern) { |file| require file }
    end
  end
end
