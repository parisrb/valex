module Valex::Validations
  class Format < Validation
    
    attr_reader :format

    # Validation for a regexp format
    def initialize(options={})
      super
      @format = options[:format] if options.has_key? :format
    end

  end
end
