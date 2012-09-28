module Mvnizer
  module Command
    class NewProject
      include Mvnizer::Configuration
      include Mvnizer::TaskHelper

      # Creates the Maven project structure, and creates the pom file
      # from the options
      def run(project)

        create_dir("#{project.artifact_id}/src/main/java",
                   "#{project.artifact_id}/src/test/java")

        coordinate_parser = CoordinateParser.new
        get_dependencies.each { |d| project.add_dependency(coordinate_parser.parse_scoped_coordinates(d)) }

        generate_file(File.join(TEMPLATE_DIR, "pom.xml.erb"), 
                      "#{project.artifact_id}/pom.xml",
                      project)
      end

      # Returns the list of dependencies to be added for this type of project.
      # Override this method if extra dependencies are needed.
      def get_dependencies
        []
      end
      
    end
  end
end
