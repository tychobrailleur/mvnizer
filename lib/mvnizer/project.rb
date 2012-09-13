module Mvnizer
  class Project
    attr_reader :group_id, :artifact_id, :version
    def initialize(group_id, artifact_id, version)
      @group_id = group_id
      @artifact_id = artifact_id
      @version = version
    end
  end
end
