Sequel::Model.plugin :validation_helpers

TestSequel::DB.create_table :users do
  primary_key :id
  String :name, :null => true, :index => true, :unique => true
end

TestSequel::DB.create_table :luzers do
  primary_key :id
  String :name, :null => true, :index => true, :unique => true
end

class User < Sequel::Model

  def validate
    validates_presence :name
  end

end

class Luser < Sequel::Model(:luzers)

  def validate
    validates_presence :name
  end

end
