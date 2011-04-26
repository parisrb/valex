# Base validation class
module Valex::Validations
  class Validation
    attr_reader :options

    def initialize(options={})
      @options = options
    end
  end
end
