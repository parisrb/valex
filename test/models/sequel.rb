require 'sequel'

DB = Sequel.sqlite

Sequel::Model.plugin :validation_helpers

DB.create_table :users do
    primary_key :id
    String :name, :null => true, :index => true, :unique => true
end

class User < Sequel::Model

  def validate
    validates_presence :name
    validates_unique :name
  end

end
