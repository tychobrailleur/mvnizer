module Mvnizer
  # This class handles the generation of the content of the pom file.
  class PomGenerator
    # Creates the pom content by reading the erb template.
    def generate(project)
      template = File.open(File.join(File.dirname(__FILE__), 'templates', 'pom.xml.erb'), 'r').read
      ERB.new(template).result(project.get_binding)
    end
  end
end
