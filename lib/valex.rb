require 'json'

module Valex

  # Represents a model, contains the associated validations.
  class Model

    attr_reader :name, :validations

    def initialize name
      @name = name
      @validations = []
    end

    def to_json(*a)
      {:name => name, :validations => validations}.to_json(*a)
    end

  end

  # Represents a validation.
  class Validation

  end

  # Validate the presence of a field.
  class PresenceValidation

    attr_reader :field_name

    def initialize field_name
      @field_name = field_name
    end

    def to_json(*a)
      {:field_name => field_name}.to_json(*a)
    end

  end

  # Validation the length of a field.
  class LengthValidation

    attr_reader :min, :max

    def initialize min, max
      @min = min
      @max = max
    end

    def to_json(*a)
      result = {}
      if min
        result[:min] = min
      end
      if min
        result[:max] = max
      end
      result.to_json(*a)
    end

  end

end
