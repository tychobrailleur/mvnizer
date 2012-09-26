require 'fileutils'
require 'nokogiri'

module Mvnizer
  # The +TaskHelper+ provides different functions that can be used in tasks,
  # such as function to create directories, generate files from templates, etc.
  module TaskHelper
    # path to the template location.
    TEMPLATE_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

    # creates recursively all directories passed as a param.
    def create_dir(*dir)
      dir.each { |d| FileUtils.mkdir_p d }
    end

    # generates the file +destination_file+ from template +template+
    # and object +binding+.  +binding+ must be an ERB binding. 
    # +destination_file+ must be the aboslute location to the generated
    # file.
    # If the output folder in which the file gets generated does not exist,
    # it automatically gets created.
    def generate_file(template, destination_file, binding)
      dir = File.dirname(destination_file)
      create_dir(dir) unless File.exists?(dir)

      template = File.open(template, 'r').read

      File.open(destination_file, "w") do |f|
        f.write(ERB.new(template).result(binding.get_binding))
      end
    end

    # adds a list of dependencies to the pom file whose location
    # can be given as +pom_location+.  By default, this function 
    # looks up the pom in the current directory.
    def add_dependency(dependency, pom_location = "pom.xml")
      raise FileNotFoundError, "The pom.xml file cannot be found." unless File.exists?(pom_location)

      coordinate_parser = CoordinateParser.new

      pom = Nokogiri::XML(File.open(pom_location)) do |conf|
        conf.default_xml.noblanks
      end
      dependencies_node = pom.xpath("/pom:project/pom:dependencies", {"pom" => "http://maven.apache.org/POM/4.0.0"}).first

      dependency.each do |d|
        # First parse the dependency coordinates
        dep_project = coordinate_parser.parse_scoped_coordinates(d)
        puts dep_project

        Nokogiri::XML::Builder.with(dependencies_node) do |xml|
          xml.dependency {
            xml.groupId dep_project.group_id
            xml.artifactId dep_project.artifact_id
            xml.version dep_project.version
            xml.scope dep_project.scope if dep_project.scope != nil && dep_project.scope != "compile"
            xml.type dep_project.type if dep_project.type != "jar"
          }
        end
      end

      puts pom.to_xml(indent: 2)
    end
  end

  # Error thrown when the pom file cannot be found.
  class FileNotFoundError < StandardError; end
end
