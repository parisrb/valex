module Valex::Validations

  # Validate the numericality of a field.
  class Numericality < Validation

    attr_reader :equal_to, :even, :greater_than, :greater_than_or_equal_to,
                :less_than, :less_than_or_equal_to, :odd, :only_integer, :message

    def initialize(options={})
      super
      # Specify a value the field must be exactly.
      @equal_to = options[:equal_to] if options[:equal_to]
      # Set that the value must be even.
      @even = options[:even] if options[:even]
      # Specify a value the field must be greater than.
      @greater_than = options[:greater_than] if options[:greater_than]
      # Specify a value the field must be greater than or equal to.
      @greater_than_or_equal_to = options[:greater_than_or_equal_to] if options[:greater_than_or_equal_to]
      # Specify a value the field must be less than.
      @less_than = options[:less_than] if options[:less_than]
      # Specify a value the field must be less than or equal to.
      @less_than_or_equal_to = options[:less_than_or_equal_to] if options[:less_than_or_equal_to]
      # Set that the value must be odd.
      @odd = options[:odd] if options[:odd]
      # Set whether the value has to be an integer.
      @only_integer = options[:only_integer] if options[:only_integer]
    end

  end
end
