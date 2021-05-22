# encoding: utf-8
require 'spec_helper'
require 'mvnizer/commands/new_war_project'

module Mvnizer
  module Command
    describe ProjectFactory do
      it "returns an instance of NewProject when passing jar" do
        expect(ProjectFactory.create("jar")).to be_a(NewProject)
        expect(ProjectFactory.create("jar")).not_to be_a(NewWarProject)
      end

      it "returns an instance of NewWarProject when passing war" do
        expect(ProjectFactory.create("war")).to be_a(NewWarProject)
      end

      it "throws an error when unknown type is passed" do
        expect { ProjectFactory.create("foo") }.to raise_error(ArgumentError, "Don’t know how to create foo.")
      end
    end
  end
end
