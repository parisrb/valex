module Valex
  class Attribute

    attr_reader :name, :type

    def initialize attr_name, type
      @name = attr_name
      @type = type
    end

  end
end
