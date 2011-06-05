module Valex::Validations

  # Base validation class
  class Validation
    attr_reader :options
    attr_accessor :attribute

    # Create a validation with the list of options
    # Each validation type will use these options to get the attribute they need
    def initialize(options={})
      @options = options
    end
  end

end
