# encoding: utf-8
require 'spec_helper'
require 'mvnizer/commands/new_war_project'

module Mvnizer
  module Command
    describe ProjectFactory do
      it "returns an instance of NewProject when passing jar" do
        ProjectFactory.create("jar").should be_a(NewProject)
        ProjectFactory.create("jar").should_not be_a(NewWarProject)
      end

      it "returns an instance of NewWarProject when passing war" do
        ProjectFactory.create("war").should be_a(NewWarProject)
      end

      it "throws an error when unknown type is passed" do
        lambda { ProjectFactory.create("foo") }.should raise_error(ArgumentError, "Don’t know how to create foo.")
      end
    end
  end
end
