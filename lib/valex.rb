module Valex
  # Represents a validation.
  module Validations
    class Validation
      attr_reader :options

      def initialize(options={})
        @options = options
      end
    end
  end

  module Adapters

    # Transform a set of models from an ORM to Valex models.
    class Adapter

    end

  end
end

require "valex/valex"
require "valex/model"
require "valex/attribute"
require "valex/validations/format"
require "valex/validations/length"
require "valex/validations/presence"
