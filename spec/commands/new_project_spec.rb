require 'spec_helper'


module Mvnizer
  module Command
    describe NewProject do
      let(:project) {  Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war") }
      subject { Mvnizer::Command::NewProject.new }


      it "creates the project directory" do
        subject.should_receive(:generate_file)
        subject.should_receive(:create_dir).with("foobar/src/main/java", "foobar/src/test/java")

        subject.run(project)
      end

      it "generates the pom file" do
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "pom.xml.erb"), "foobar/pom.xml", project)
        subject.run(project)
      end
    end
  end
end
