require 'fileutils'

module Mvnizer
  class DirCreator
    # creates recursively all directories passed as a param.
    def create(*dir)
      dir.each { |d| FileUtils.mkdir_p d }
    end
  end
end
