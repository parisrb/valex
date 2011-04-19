module Valex
  class Attribute

    attr_reader :name, :type

    def initialize attr_name, type
      @name = attr_name
      @type = type
    end

    def to_json(*a)
      {:name => name, :type => type}.to_json(*a)
    end
  end
end
