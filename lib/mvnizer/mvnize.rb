module Mvnizer
  # Mvnize is the main entry point into Mvnizer.
  class Mvnize
    include Configuration
    attr_writer :out

    def initialize(coordinate_parser = Mvnizer::CoordinateParser.new)
      @coordinate_parser = coordinate_parser
    end

    def out
      @out ||= $stdout
    end

    # Execute the right command depending on the :command parameter
    # passed in +options+.
    # If the command does not exit, throw an error.
    def run(options)
      raise ArgumentError, "Please give a name to the project." unless options[:name]
      project_details = define_project(options)

      if options[:command] == "new"
        project_command = Mvnizer::Command::ProjectFactory.create(project_details.type)

        project_command.run(project_details)
        out.puts("Project #{project_details.artifact_id} created successfully.")
      else
        raise ArgumentError, "#{options[:command]} is not a valid command."
      end
    end

    private
    # Creates an instance of +Project+ class populated with the coordinates
    # set with the user’s definition, or default values if not set.
    def define_project(options)
      # Get coordinates provided by the user on the CLI.
      coordinates = options[:name]
      # Retrieve default options
      options = conf(options)
      
      # Parse user coordinates, and found values override options
      project = @coordinate_parser.parse(coordinates)
      return_project = Project.new(project.group_id || options[:group_id],
                                   project.artifact_id,
                                   project.version || options[:version],
                                   project.type || options[:type])
      

      # Get default dependencies, and add them after having parsed their coords.
      dependencies = options[:dependencies]
      dependencies.each do |d|
        return_project.add_dependency(@coordinate_parser.parse_scoped_coordinates(d))
      end if dependencies
      
      return_project
    end
  end
end
