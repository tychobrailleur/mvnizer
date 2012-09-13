require 'yaml'

module Mvnizer
  module Configuration
    def conf(options)
      config_file = File.join(File.dirname(__FILE__), "..", "..", "conf", "default.yml")
      default_config = YAML.load_file(config_file)

      default_config.merge(options)
    end
  end
end
