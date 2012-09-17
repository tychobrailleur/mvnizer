module Mvnizer
  # Class representing a project coordinates.
  # The elements of the coordinates are read-only.
  class Project
    include Erbicole
    attr_reader :group_id, :artifact_id, :version, :type, :dependencies, :scope

    def initialize(group_id, artifact_id, version, type, dependencies = [], scope = nil)
      @group_id = group_id
      @artifact_id = artifact_id
      @version = version
      @type = type
      @dependencies = dependencies
      @scope = scope
    end

    def add_dependency(dependency)
      @dependencies << dependency
    end

    # Check whether the project coordinates of this project 
    # match the ones of the other project.
    def ==(project)
      (group_id == project.group_id \
       && artifact_id == project.artifact_id \
       && version == project.version \
       && type == project.type)
    end

    # Converts project into its coordinates representation.
    def to_s
      "#{group_id}:#{artifact_id}:#{version}:#{type}:#{scope}"
    end
  end
end
