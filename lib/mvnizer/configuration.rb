require 'yaml'

module Mvnizer
  module Configuration
    def conf(options)
      config_file = File.join(File.dirname(__FILE__), "..", "..", "conf", "default.yml")
      default_config = YAML.load_file(config_file)

      symbolize_keys(default_config.merge(symbolize_keys(options)))
    end

    private
    def symbolize_keys(hash)
      h = hash.dup
      h.keys.each do |key|
        h[(key.to_sym rescue key) || key] = h.delete(key)
      end
      h
    end
  end
end
