# Validate the numericality of a field.
module Valex::Validations
  class Numericality < Validation

    attr_reader :equal_to, :even, :greater_than, :greater_than_or_equal_to,
      :less_than, :less_than_or_equal_to, :odd, :only_integer, :message

    def initialize
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
      # Supply a custom error message.
      @message = options[:message] if options[:message]
    end

    def to_json(*a)
      result = {}
      result[:equal_to] = equal_to if equal_to
      result[:even] = even if even
      result[:greater_than] = greater_than if greater_than
      result[:greater_than_or_equal_to] = greater_than_or_equal_to if greater_than_or_equal_to
      result[:less_than] = less_than if less_than
      result[:less_than_or_equal_to] = less_than_or_equal_to if less_than_or_equal_to
      result[:odd] = odd if odd
      result[:only_integer] = only_integer if only_integer

      result.to_json(*a)
    end
  end
end
