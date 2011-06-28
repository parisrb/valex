Sequel::Model.plugin :validation_helpers

SequelTestDB.create_table :users do
  primary_key :id
  String :name, :null => true, :index => true, :unique => true
end

SequelTestDB.create_table :luzers do
  primary_key :id
  String :name, :null => true, :index => true, :unique => true
end

module Valex
module Test
module Sequel

  class User < ::Sequel::Model

    def validate
      validates_presence :name
    end

  end

  class Luser < ::Sequel::Model(:luzers)

    def validate
      validates_presence :name
      validates_unique :name
    end

  end

end
end
end
