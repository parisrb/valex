# Represents a model, contains the associated attributes and validations.
class Valex::Model

  attr_accessor :attributes, :validations, :name

  def initialize name
    @name = name
    @attributes = {}
    @validations = []
  end

  def to_json(*a)
    {:name => name, :attributes => attributes, :validations => validations}.to_json(*a)
  end

  def export(exporter=:json)

  end

end
