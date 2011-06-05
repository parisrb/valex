# Represents an attribute
class Valex::Attribute

  attr_reader :name, :type
  attr_accessor :validations

  # Initialize with a name and type
  def initialize(attr_name, type)
    @name = attr_name
    @type = type
    @validations = []
  end

end
