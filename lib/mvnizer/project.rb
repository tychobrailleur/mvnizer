module Mvnizer
  # Class representing a project coordinates.
  class Project
    attr_reader :group_id, :artifact_id, :version, :type
    def initialize(group_id, artifact_id, version, type)
      @group_id = group_id
      @artifact_id = artifact_id
      @version = version
      @type = type
    end

    def get_binding
      binding
    end
  end
end
