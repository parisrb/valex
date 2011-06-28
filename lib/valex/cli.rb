require 'thor'
require 'valex'

class Thor
  class Arguments
    def parse_hash(name)
      return shift if peek.is_a?(Hash)
      hash = {}

      while current_is_value? && peek.include?(?:)
        t = shift.match(/([^:]*):(.*)/)
        key = t[1]
        value = t[2]
        hash[key] = value
      end
      hash
    end
  end
end

module Valex
  class CLI<Thor
    include Thor::Actions

    desc "export", "Export validations"
    method_option :adapter, :type => :string, :required => true, :aliases => '-a'
    method_option :exporter, :type => :string, :default => 'json', :aliases => '-e'
    method_option :params, :type => :hash, :default => {}, :aliases => '-p'
    def export(model_path, output='valex.json')
      valex = ::Valex::Valex.new(options[:adapter], options[:params], options[:exporter])
      valex.process(model_path)
      File.open(output, 'w') do |f|
        f << valex.export
      end
    end
  end
end
