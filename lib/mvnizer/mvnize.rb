module Mvnizer
  # Mvnize is the main entry point into Mvnizer.
  class Mvnize
    attr_writer :out

    def out
      @out ||= $stdout
    end

    def self.new_project
      @new_project ||= Mvnizer::Command::NewProject.new
    end

    # Execute the right command depending on the :command parameter
    # passed in +options+.
    # If the command does not exit, throw an error.
    def run(options)
      raise ArgumentError, "Please give a name to the project." unless options[:name]
      if options[:command] == "new"
        # FIXME: coordinates should be parsed here to check type.
        # and pass to the factory, rather than doing this if, 
        # and parse coordinates later down in NewProject.
        if options[:name] =~ /:war$/
          project = Mvnizer::Command::ProjectFactory.create("war") 
        else
          project = Mvnizer::Command::ProjectFactory.create("jar")
        end

        project.run(options)
        out.puts("Project created successfully.")
      else
        raise ArgumentError, "#{options[:command]} is not a valid command."
      end
    end
  end
end
