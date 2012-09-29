require 'spec_helper'

module Mvnizer
  module Command
    describe AddDependency do
      let (:file) { double("file") }

      subject { AddDependency.new }
      it "checks the pom can be found in the current directory" do
        lambda { subject.run({}) }.should raise_error(FileNotFoundError, "The pom.xml file cannot be found.")
      end

      it "adds a dependency" do
        options = { name: "test" }

        File.should_receive(:exists?).and_return(true)
        subject.should_receive(:add_dependency).with(["test"]).and_return("out")
        File.should_receive(:open).with("pom.xml", "w").and_yield(file)
        file.should_receive(:write).with("out")

        subject.run(options)
      end
    end
  end
end
