# Represents a model, contains the associated validations.
class Valex::Model

  attr_reader :name

  attr_accessor :attributes, :validations

  def initialize name
    @name = name
    @attributes = []
    @validations = []
  end

  def to_json(*a)
    {:name => name, :attributes => attributes, :validations => validations}.to_json(*a)
  end

end
