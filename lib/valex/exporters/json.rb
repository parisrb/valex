require 'json'

module Valex::Exporters

  # Export validations in plain JSON
  class JSONExporter

    def process(models)
      process_to_ruby(models).to_json
    end

    # Do the export into ruby object
    def process_to_ruby(models)
      models.collect do |model|
        attributes = {}
        model.attributes.each_value do |attribute|
          validations = attribute.validations.collect do |validation|
            {:type => validation.class.name.split('::').pop.downcase}.update(validation.options)
          end
          attributes[attribute.name] = [:validations => validations, :type => attribute.type]
        end
        {:name => model.name, :attributes => attributes}
      end
    end

  end

end