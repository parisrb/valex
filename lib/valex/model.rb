# Represents a model, contains the associated validations.
class Valex::Model

  attr_reader :name, :validations

  def initialize name
    @name = name
    @validations = []
  end

  def to_json(*a)
    {:name => name, :validations => validations}.to_json(*a)
  end

end
