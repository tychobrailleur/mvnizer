module Mvnizer
  module Command
    class NewProject
      include Mvnizer::Configuration
      include Mvnizer::TaskHelper

      def initialize(coordinate_parser = Mvnizer::CoordinateParser.new)
        @coordinate_parser = coordinate_parser
      end

      # Creates the Maven project structure, and creates the pom file
      # from the options
      def run(options)
        @project = define_project(options)

        create_dir("#{@project.artifact_id}/src/main/java",
                   "#{@project.artifact_id}/src/test/java")

        generate_file(File.join(TEMPLATE_DIR, "pom.xml.erb"), 
                      "#{@project.artifact_id}/pom.xml",
                      @project)
      end
      
      private
      # Creates an instance of +Project+ class populated with the coordinates
      # set with the user’s definition, or default values if not set.
      def define_project(options)
        coordinates = options[:name]
        options = conf(options)
        
        project = @coordinate_parser.parse(coordinates)
        return_project = Project.new(project.group_id || options[:group_id],
                                     project.artifact_id,
                                     project.version || options[:version],
                                     project.type || options[:type])
        
        dependencies = options[:dependencies]
        dependencies.each do |d|
          return_project.add_dependency(@coordinate_parser.parse_scoped_coordinates(d))
        end if dependencies
        
        return_project
      end
    end
  end
end
