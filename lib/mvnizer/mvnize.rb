module Mvnizer
  class Mvnize
    include Configuration

    def initialize(generator = Mvnizer::PomGenerator.new, dir_creator = Mvnizer::DirCreator.new)
      @generator = generator
      @dir_creator = dir_creator
    end

    # Creates the Maven project structure, and creates the pom file
    # from the options
    def run(options)
      options = conf(options)

      @dir_creator.create("#{options[:name]}/src/main/java", 
                          "#{options[:name]}/src/test/java")

      File.open("#{options[:name]}/pom.xml", "w") do |f|
        f.write(@generator.generate(options))
      end
    end 
  end
end
