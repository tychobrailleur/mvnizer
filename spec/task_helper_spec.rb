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

    describe "#create_dir" do
      it "creates a list of directories" do
        subject.create_dir("/tmp/blah/blah", "/tmp/foo/bar")
        expect(Dir.exists?("/tmp/blah/blah")).to be true
        expect(Dir.exists?("/tmp/foo/bar")).to be true
      end
    end

    describe "#generate_file" do
      it "generates a file from a template into a given directory" do

        # This checks ERB is called properly.
        expect(ERB).to receive(:new).and_return(erb)
        expect(binding).to receive(:get_binding)
        expect(erb).to receive(:result).and_return("Blah")

        # This checks that the template is being read
        expect(File).to receive(:open).with("dummy.txt.erb", "r").and_return(file)
        expect(file).to receive(:read)

        # This checks that the output is being written.
        f = double("output_file")
        expect(File).to receive(:open).with("foobar/dummy.txt", "w").and_yield(f)
        expect(f).to receive(:write).with("Blah")

        subject.generate_file("dummy.txt.erb", "foobar/dummy.txt", binding)
      end

      it "creates the output directory if it does not exist" do
        expect(subject).to receive(:create_dir).with("foo")
        expect(File).to receive(:open).at_least(1).times.and_return(file)
        expect(file).to receive(:read)
        subject.generate_file("dummy.txt.erb", "foo/dummy.txt", binding)
      end
    end

    describe "#add_dependency" do
      it "adds a new dependency to an existing pom file" do
        dependencies = ["org.apache.commons:commons-lang3:3.1:jar",
                        "org.apache.commons:commons-collections:3.2.1:jar"]

        pom_location = File.join(File.dirname(__FILE__), "dummy_pom.xml")
        output = subject.add_dependency(dependencies, pom_location)
        expect(output).to match("<groupId>org.apache.commons</groupId>")
      end

      it "throws an error if the pom cannot be found in the current directory" do
        expect { subject.add_dependency(nil) }.to raise_error(FileNotFoundError, "The pom.xml file cannot be found.")
      end
    end
  end
end
