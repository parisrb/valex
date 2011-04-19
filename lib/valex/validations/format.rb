# Validation for a regexp format
module Vales::Validations
  class Format < Validation
    attr_reader :format

    def initialize format
      @format = format
    end

    def to_json(*a)
      {}.tap { |result|
        result[:format] = format
      }.to_json(*a)
    end
  end
end
