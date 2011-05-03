module Valex
  class Attribute

    attr_reader :name, :type
    attr_accessor :validations

    def initialize attr_name, type
      @name = attr_name
      @type = type
      @validations = []
    end

  end
end
