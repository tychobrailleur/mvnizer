require 'spec_helper'
require 'mvnizer/commands/new_war_project'

module Mvnizer
  module Command
    describe NewWarProject do

      let(:project) { Mvnizer::Project.new("test", "foobar", nil, nil) }
      subject { Mvnizer::Command::NewWarProject.new }

      before do
        $run = false
        class NewProject
          alias old_run run
          def run(project)
            $run = true
          end
        end

        subject.instance_variable_set(:@project, project)
      end

      it "creates a basic project" do
        subject.should_receive(:create_dir)
        subject.should_receive(:generate_file).exactly(3).times
        subject.run(project)
        $run.should be_true
      end

      it "creates the webapp directory" do
        subject.should_receive(:create_dir).with("foobar/src/main/webapp/WEB-INF")
        subject.should_receive(:generate_file).exactly(3).times
        subject.run(project)
      end

      it "generates all the webapp files file" do
        subject.should_receive(:create_dir)
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "web.xml.erb"), "foobar/src/main/webapp/WEB-INF/web.xml", project)
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "war", "ExampleServlet.java.erb"), "foobar/src/main/java/test/foobar/ExampleServlet.java", project)
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "war", "index.jsp.erb"), "foobar/src/main/webapp/WEB-INF/index.jsp", project)


        subject.run(project)
      end

      it "ensures packages for generated classes are valid" do
        pending
      end

      it "adds the dependencies needed for a war file" do
        deps = subject.get_dependencies
        deps.include?("javax:javaee-web-api:6.0:jar:provided").should be_true
      end

      after do
        class NewProject
          alias run old_run
        end
      end
    end
  end
end
