require 'spec_helper'
require 'mvnizer/commands/new_war_project'

module Mvnizer
  module Command
    describe NewWarProject do

      let(:project) { Mvnizer::Project.new(nil, "foobar", nil, nil) }
      let(:coordinate_parser) { double("coordinate_parser") } 

      subject { Mvnizer::Command::NewWarProject.new(coordinate_parser) }

      before do
        $run = false
        class NewProject
          alias old_run run
          def run(options)
            $run = true
          end
        end

        subject.instance_variable_set(:@project, project)
      end

      it "creates a basic project" do
        options = {}
        subject.should_receive(:create_dir)
        subject.should_receive(:generate_file)
        subject.run(options)
        $run.should be_true
      end

      it "creates the webapp directory" do
        options = {name: "foobar"}
        subject.should_receive(:create_dir).with("foobar/src/main/webapp/WEB-INF")
        subject.should_receive(:generate_file)
        subject.run(options)
      end

      it "generates the web.xml file" do
        options = {name: "foobar"}
        subject.should_receive(:create_dir)
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "web.xml.erb"),
                                                    "foobar/src/main/webapp/WEB-INF/web.xml", project)

        subject.run(options)
      end

      after do
        class NewProject
          alias run old_run
        end
      end
    end
  end
end
