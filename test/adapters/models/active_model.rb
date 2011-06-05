module Valex::Test::ActiveModel

  class User
    include ActiveModel::Validations

    validates_presence_of :name

    attr_accessor :id, :name
  end

end