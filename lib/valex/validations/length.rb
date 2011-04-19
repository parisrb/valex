# Validation the length of a field.
module Valex::Validations
  class Length < Validation

    attr_reader :allow_blank, :in_range, :minimum, :maximum, :message, :too_long, :too_short, :within, :wrong_length
  
    def initialize min, max, options={}
      # Specify the minimum length of the attribute.
      @minimum = options[:minimum] if options[:minimum]
      # Specify the maximum length of the attribute.
      @maximum = options[:maximum] if options[:maximum]
      # Specify whether to validate blank attributes.
      @allow_blank = options[:allow_blank] if options[:allow_blank]
      # Specify the range the length of the attribute can fall within.
      @in_range = options[:in] if options[:in]
      # Specify the range the length of the attribute can fall within.
      @within[:within] = options[:within] if options[:within]

      # Supply a custom error message.
      @message = options[:message] if options[:message]
      # Define a custom message if the attribute is too long.
      @too_long = options[:too_long] if options[:too_long]
      # Define a custom message if the attribute is too short.
      @too_short = options[:too_short] if options[:too_short]
      # Define a custom message for an incorrect length.
      @wrong_length =options[:wrong_length] if options[:wrong_length]
    end

    def to_json(*a)
      result = {}
      result[:minimum] = @minimum if minimum
      result[:maximum] = @maximum if maximum
      result[:allow_blank] = @allow_blank if allow_blank
      result[:in] = @in if in_range
      result[:within] = @within if within

      result.to_json(*a)
    end

  end
end
