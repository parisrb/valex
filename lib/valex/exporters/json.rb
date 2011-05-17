require 'json'

module Valex::Exporters

  class JSON

    def process models
      models.collect do |model|
        validations = model.validations.collect do |validation|
          {:name => validation.to_s.downcase}.update(validation.options)
        end
        # attributes = model.attributes.collect do |attribute|
        #   {:name => attribute.name, :type => attribute.type}
        # end
        {:name => model.name}.update({:validations => validations}) #, :attributes => attributes}
      end.to_json
    end

  end

end