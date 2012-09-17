require 'spec_helper'
require 'fileutils'

describe Mvnizer::DirCreator do
  subject { Mvnizer::DirCreator.new }
  # Make use of fakefs explicit by using activate! / deactivate!
  before { FakeFS.activate! }

  it "creates a list of directories" do
    subject.create("/tmp/blah/blah", "/tmp/foo/bar")
    Dir.exists?("/tmp/blah/blah").should == true
    Dir.exists?("/tmp/foo/bar").should == true
  end

  after { FakeFS.deactivate! }
#  after { ["/tmp/blah", "/tmp/foo"].each { |d| FileUtils.rm_rf(d) } }
end
