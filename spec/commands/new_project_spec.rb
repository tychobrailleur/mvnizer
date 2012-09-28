require 'spec_helper'


module Mvnizer
  module Command
    describe NewProject do
      let(:coordinate_parser) { double("parser") }
      let(:project) {  Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war") }
      subject { Mvnizer::Command::NewProject.new }

      it "creates the project directory" do
        subject.should_receive(:generate_file)
        subject.should_receive(:create_dir).with("foobar/src/main/java", "foobar/src/test/java")

        subject.run(project)
      end

      it "parses the extra dependencies and adds them" do
        subject.should_receive(:get_dependencies).and_return(["foo:bar:1.0:jar:test"])
        CoordinateParser.should_receive(:new).and_return(coordinate_parser)
        coordinate_parser.should_receive(:parse_scoped_coordinates).with("foo:bar:1.0:jar:test").and_return("Blah")
        subject.should_receive(:generate_file)
        subject.should_receive(:create_dir)

        subject.run(project)

        project.dependencies.first.should == "Blah"
      end

      it "generates the pom file" do
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "pom.xml.erb"), "foobar/pom.xml", project)
        subject.run(project)
      end
    end
  end
end
