module Mvnizer
  module Command
    class NewProject
      include Mvnizer::Configuration

      def initialize(generator = Mvnizer::PomGenerator.new,
                     dir_creator = Mvnizer::DirCreator.new,
                     coordinate_parser = Mvnizer::CoordinateParser.new)
        @generator = generator
        @dir_creator = dir_creator
        @coordinate_parser = coordinate_parser
      end

      # Creates the Maven project structure, and creates the pom file
      # from the options
      def run(options)
        @project = define_project(options)

        @dir_creator.create("#{@project.artifact_id}/src/main/java",
                            "#{@project.artifact_id}/src/test/java")

        File.open("#{@project.artifact_id}/pom.xml", "w") do |f|
          f.write(@generator.generate(@project))
        end
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
