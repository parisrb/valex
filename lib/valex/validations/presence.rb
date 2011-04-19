# Validate the presence of a field.
module Valex::Validations
  class Presence < Validation

    attr_reader :field_name

    def initialize field_name
      @field_name = field_name
    end

    def to_json(*a)
      {:field_name => field_name}.to_json(*a)
    end
  end

end
