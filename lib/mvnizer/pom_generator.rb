require 'erb'

module Mvnizer
  class Project
    attr_reader :group_id, :artifact_id, :version
    def initialize(group_id, artifact_id, version)
      @group_id = group_id
      @artifact_id = artifact_id
      @version = version
    end

    def get_binding
      binding
    end
  end

  class PomGenerator
    # Creates the pom content by reading the erb template.
    def generate(options)
      template = File.open(File.join(File.dirname(__FILE__), 'templates', 'pom.xml.erb'), 'r').read
      project = Project.new(options[:group_id], options[:name], options[:version])
      ERB.new(template).result(project.get_binding)
    end
  end
end
