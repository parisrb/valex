# Validate the presence of a field.
module Valex::Validations
  class Presence < Validation

    attr_reader :message

    def initialize options={}
      @message = options[:message] if options[:message]
    end

    def to_json(*a)
      result = {:presence => {}}
      result[:presence][:message] = message if message
      result.to_json(*a)
    end
  end

end
