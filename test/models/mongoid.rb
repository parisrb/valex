Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("valex-test")
end

module Valex::Test::Mongoid

  class User
    include Mongoid::Document

    field :name
  end

end