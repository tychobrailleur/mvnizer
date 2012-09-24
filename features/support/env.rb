require 'aruba/cucumber'
require 'fileutils'

root_dir = File.join(File.dirname(__FILE__), '..', '..')
bin_dir = File.expand_path(File.join(root_dir, 'bin'))
# FIXME: This actually doesn't work:
# aruba doesn't find the mvnizer script unless it is added to the PATH
# outside ruby.
ENV['PATH'] = "#{bin_dir}#{File::PATH_SEPARATOR}#{ENV['PATH']}"


Before do
  @aruba_timeout_seconds = 30
end

# Aruba.configure do |config|
#   config.before_cmd do |cmd|
#     puts "About to run '#{cmd}' with path = #{ENV["PATH"]}"
#   end
# end

After do
  FileUtils.rm_rf("#{root_dir}/tmp")
end
