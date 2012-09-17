module Mvnizer
  # Mvnize is the main entry point into Mvnizer.
  class Mvnize
    include Configuration

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
      original_coordinates = options[:name]
      options = conf(options)
      project = create_project(original_coordinates, options)

      @dir_creator.create("#{project.artifact_id}/src/main/java", 
                          "#{project.artifact_id}/src/test/java")

      File.open("#{project.artifact_id}/pom.xml", "w") do |f|
        f.write(@generator.generate(project))
      end
    end

    private 
    def create_project(coordinates, options)
      project = @coordinate_parser.parse(coordinates)
      Project.new(project.group_id || options[:group_id],
                  project.artifact_id,
                  project.version || options[:version],
                  project.type || options[:type]) 
    end
  end
end
