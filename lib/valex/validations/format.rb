# Validation for a regexp format
module Valex::Validations
  class Format < Validation
    
    attr_reader :format

    def initialize options={}
      super
      @format = options[:format] if options.has_key? :format
    end

  end
end
