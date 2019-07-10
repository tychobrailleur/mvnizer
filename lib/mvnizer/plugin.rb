module Mvnizer
  class Plugin
    attr_reader :group_id, :artifact_id, :version, :configuration, :executions

    def initialize(group_id, artifact_id, version, configuration, executions = [])
      @group_id = group_id
      @artifact_id = artifact_id
      @version = version
      @configuration = configuration
      @executions = executions
    end
  end
end
