require 'spec_helper'

module Mvnizer
  describe Project do

    describe "#package_name" do
      it "returns the package name based on coordinates" do
        project = Project.new("foo", "bar", nil, nil)
        project.package_name.should == "foo.bar"
      end

      it "ignores nil group id" do
        project = Project.new(nil, "bar", nil, nil)
        project.package_name.should == "bar"
      end

      it "removes invalid characters in package name" do
        project = Project.new("f-oo", "b-ar", nil, nil)
        project.package_name.should == "foo.bar"
      end
    end
  end
end
