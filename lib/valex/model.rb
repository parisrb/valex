# Represents a model, contains the associated attributes and validations.
class Valex::Model

  attr_accessor :name, :attributes, :validations

  def initialize name
    @name = name
    @attributes = {}
    @validations = []
  end

end
