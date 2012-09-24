require 'spec_helper'
require 'erb'

module Mvnizer
  class Dummy
    include TaskHelper
  end

  describe TaskHelper do
    let (:binding) { double("binding") }
    let (:erb) { double("erb") }
    let (:file) { double("file") }
    subject { Dummy.new }

    # Make use of fakefs explicit by using activate! / deactivate!
    before do
      FakeFS.activate!
      FileUtils.mkdir("foobar")
      FileUtils.touch("dummy.txt.erb")
    end

    describe "#create_dir" do
      it "creates a list of directories" do
        subject.create_dir("/tmp/blah/blah", "/tmp/foo/bar")
        Dir.exists?("/tmp/blah/blah").should be_true
        Dir.exists?("/tmp/foo/bar").should be_true
      end
    end
    
    describe "#generate_file" do
      it "generates a file from a template into a given directory" do
        ERB.should_receive(:new).and_return(erb)
        binding.should_receive(:get_binding)
        erb.should_receive(:result).and_return("")
        subject.generate_file("dummy.txt.erb", "foobar/dummy.txt", binding)

        File.exists?("foobar/dummy.txt").should be_true
      end
      
      it "creates the output directory if it does not exist" do
        subject.should_receive(:create_dir).with("foo")
        File.should_receive(:open).any_number_of_times.and_return(file)
        file.should_receive(:read)
        subject.generate_file("dummy.txt.erb", "foo/dummy.txt", binding)
      end
    end

    after do
      FileUtils.rm_rf("foobar")
      FakeFS.deactivate! 
    end
  end
end
