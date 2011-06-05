module Valex::Exporters

# Export for the jQuery validation plugin.
# Generate an hash object containing the validation rules for each model.
# See http://docs.jquery.com/Plugins/validation
  class JQuery
    def process(models)
      result = {}
      models.each do |model|
        model_result = {}
        model.attributes.each_value do |attribute|
          attribute.validations.each do |validation|
            case validation
              when Valex::Validations::Presence
                model_result[:required] = true
              when Valex::Validations::Unique
                # not available
              when Valex::Validations::Length
                if validation.allow_blank
                  model_result[:required] = true
                end
                if validation.minimum && validation.maximum
                  model_result[:rangelength] = [validation.minimum, validation.maximum]
                elsif validation.maximum
                  model_result[:maxlength] = validation.maximum
                elsif validation.minimum
                  model_result[:minlength] = validation.minimum
                end
              else
                warn "Unknown validation #{validation}"
            end
          end
        end
        result[model.name] = model_result
      end
      result
    end
  end
end