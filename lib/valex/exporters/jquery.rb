require 'json'

module Valex::Exporters

# Export for the jQuery validation plugin.
# Generate an hash object containing the validation rules for each model.
# See http://docs.jquery.com/Plugins/validation
  class JQueryExporter

    # Export the models in json
    def process(models)
      process_to_ruby(models).to_json
    end

    # Do the export into ruby object
    def process_to_ruby(models)
      result = {}
      models.each do |model|
        # will contain the parameters to
        model_result = {}
        model.attributes.each_value do |attribute|
          attribute.validations.each do |validation|
            case validation
              when Valex::Validations::Presence
                model_result[:required] = true
              when Valex::Validations::Unique
                # not available
              when Valex::Validations::Length
                process_length_validation(validation, model_result)
              when Valex::Validations::Numericality
                process_numericality_validation(validation, model_result)
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

  private

  # length validation
  def process_length_validation(validation, model_result)
    if validation.allow_blank
      model_result[:required] = false
    end
    if validation.minimum && validation.maximum
      model_result[:rangelength] = [validation.minimum, validation.maximum]
    elsif validation.maximum
      model_result[:maxlength] = validation.maximum
    elsif validation.minimum
      model_result[:minlength] = validation.minimum
    end
  end
  
  # numericality validation
  def process_numericality_validation(validation, model_result)
    if validation.equal_to
      model_result[:range] = [validation.equal_to, validation.equal_to]
    end

    if validation.greater_than_or_equal_to
      model_result[:min] = validation.greater_than_or_equal_to
    end
    if validation.less_than_or_equal_to
      model_result[:max] = validation.less_than_or_equal_to
    end

    if validation.greater_than
      model_result[:min] = validation.greater_than
    end
    if validation.less_than
      model_result[:max] = validation.less_than
    end

    # not perfect but best we can do without adding custom code
    if validation.only_integer
      model_result[:number] = validation.only_integer
    end

  end
end