module Valex::Validations

# Validation the length of a field.
  class Length < Validation

    attr_reader :allow_blank, :minimum, :maximum

    def initialize(options={})
      super
      # Specify the minimum length of the attribute.
      @minimum = options[:minimum] if options[:minimum]
      # Specify the maximum length of the attribute.
      @maximum = options[:maximum] if options[:maximum]
      # Specify whether to validate blank attributes.
      @allow_blank = options[:allow_blank] if options[:allow_blank]
    end

  end

end
