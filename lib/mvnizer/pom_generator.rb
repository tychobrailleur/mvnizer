module Mvnizer
  # This class handles the generation of the content of the pom file.
  class PomGenerator
    # Creates the pom content by reading the erb template.
    def generate(options)
      template = File.open(File.join(File.dirname(__FILE__), 'templates', 'pom.xml.erb'), 'r').read
      project = Project.new(options[:group_id], options[:name], options[:version], options[:type])
      ERB.new(template).result(project.get_binding)
    end
  end
end
