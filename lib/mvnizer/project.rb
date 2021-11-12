module Mvnizer
  # Class representing a project coordinates.
  # The elements of the coordinates are read-only.
  class Project
    include Erbicole
    attr_reader :group_id, :artifact_id, :version, :type, :dependencies, :scope, :plugins, :docker

    def initialize(group_id, artifact_id, version, type, dependencies = [], scope = nil, plugins = [], docker = false)
      @group_id = group_id
      @artifact_id = artifact_id
      @version = version
      @type = type
      @dependencies = dependencies
      @scope = scope
      @plugins = plugins
      @docker = docker
    end

    def add_dependency(dependency)
      @dependencies << dependency
    end

    def add_plugin(plugin)
      @plugins << plugin
    end

    # Check whether the project coordinates of this project
    # match the ones of the other project.
    def ==(project)
      (group_id == project.group_id \
       && artifact_id == project.artifact_id \
       && version == project.version \
       && type == project.type)
    end

    def package_name
      package = artifact_id
      package = "#{group_id}.#{package}" unless group_id == nil
      package.gsub(/\-/, "")
    end

    # Converts project into its coordinates representation.
    def to_s
      "#{group_id}:#{artifact_id}:#{version}:#{type}:#{scope}"
    end
  end
end
