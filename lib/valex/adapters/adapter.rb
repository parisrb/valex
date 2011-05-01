module Valex::Adapters

  # Transform a set of models from an ORM to Valex models.
  class Adapter

    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
    end

  end

end
