
Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("valex-test")
end

class User
  include Mongoid::Document

  field :name
end
