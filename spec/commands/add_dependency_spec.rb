require 'spec_helper'

module Mvnizer
  module Command
    describe AddDependency do
      let (:file) { double("file") }

      subject { AddDependency.new }
      it "checks the pom can be found in the current directory" do
        expect { subject.run({}) }.to raise_error(FileNotFoundError, "The pom.xml file cannot be found.")
      end

      it "adds a dependency" do
        options = { name: "test" }

        expect(File).to receive(:exists?).and_return(true)
        expect(subject).to receive(:add_dependency).with(["test"]).and_return("out")
        expect(File).to receive(:open).with("pom.xml", "w").and_yield(file)
        expect(file).to receive(:write).with("out")

        subject.run(options)
      end
    end
  end
end
