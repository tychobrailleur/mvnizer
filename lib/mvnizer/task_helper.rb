require 'fileutils'

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
  end
end
