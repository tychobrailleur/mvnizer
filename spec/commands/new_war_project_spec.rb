require 'spec_helper'
require 'mvnizer/commands/new_war_project'

module Mvnizer
  module Command
    describe NewWarProject do

      let(:project) { Mvnizer::Project.new(nil, "foobar", nil, nil) }
      let(:generator) { double("generator") }
      let(:coordinate_parser) { double("coordinate_parser") } 
      let(:dir_creator) { double("dir_creator") }

      subject { Mvnizer::Command::NewWarProject.new(generator, dir_creator, coordinate_parser) }

      before do
        $run = false
        class NewProject
          alias old_run run
          def run(options)
            $run = true
          end
        end

        subject.instance_variable_set(:@project, project)
        FakeFS.activate!
        FileUtils.mkdir_p("foobar")

        templates_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'mvnizer', 'templates')
        FileUtils.mkdir_p(templates_dir)
        FileUtils.touch(File.join(templates_dir, "web.xml.erb"))
      end

      it "creates a basic project" do
        options = {}
        dir_creator.should_receive(:create)
        subject.run(options)
        $run.should be_true
      end

      it "creates the webapp directory" do
        options = {name: "foobar"}
        dir_creator.should_receive(:create).with("foobar/src/main/webapp/WEB-INF")
        subject.run(options)
      end

      it "generates the web.xml file" do
        options = {name: "foobar"}
        dir_creator.should_receive(:create)

        subject.run(options)
        File.exists?("foobar/src/main/webapp/WEB-INF/web.xml").should be_true
      end

      after do
        FileUtils.rm_rf("foobar")
        FakeFS.deactivate!
        class NewProject
          alias run old_run
        end
      end
    end
  end
end
