# Validation the length of a field.
module Valex::Validations
  class Length < Validation

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
      if max
        result[:max] = max
      end
      result.to_json(*a)
    end

  end
end
