require 'spec_helper'

module Mvnizer
  describe Project do

    describe "#package_name" do
      it "returns the package name based on coordinates" do
        project = Project.new("foo", "bar", nil, nil)
        expect(project.package_name).to eq("foo.bar")
      end

      it "ignores nil group id" do
        project = Project.new(nil, "bar", nil, nil)
        expect(project.package_name).to eq("bar")
      end

      it "removes invalid characters in package name" do
        project = Project.new("f-oo", "b-ar", nil, nil)
        expect(project.package_name).to eq("foo.bar")
      end

      it "can have plugins" do
        project = Project.new("foo", "bar", nil, nil)
        project.add_plugin(Plugin.new("qux", "baz", nil, nil))
        expect(project.plugins.size).to eq(1)
      end
    end
  end
end
