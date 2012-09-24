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

        generate_file(File.join(TEMPLATE_DIR, "pom.xml.erb"), 
                      "#{project.artifact_id}/pom.xml",
                      project)
      end
      
    end
  end
end
