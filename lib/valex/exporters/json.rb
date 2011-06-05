require 'json'

module Valex::Exporters

  # Export validations in plain json
  class JSON

    def process(models)
      models.collect do |model|
        validations = model.validations.collect do |validation|
          {:type => validation.class.name.split('::').pop.downcase}.update(validation.options)
        end
        # attributes = model.attributes.collect do |attribute|
        #   {:name => attribute.name, :type => attribute.type}
        # end
        {:name => model.name}.update({:validations => validations}) #, :attributes => attributes}
      end.to_json
    end

  end

end