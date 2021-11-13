require 'spec_helper'


module Mvnizer
  module Command
    describe NewProject do
      let(:coordinate_parser) { double("parser") }
      let(:project) {  Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war") }
      subject { Mvnizer::Command::NewProject.new }

      it "creates the project directory" do
        expect(subject).to receive(:generate_file).exactly(3).times
        expect(subject).to receive(:create_dir).with("foobar/src/main/java", "foobar/src/test/java")

        subject.run(project)
      end

      it "parses the extra dependencies and adds them" do
        expect(subject).to receive(:get_dependencies).and_return(["foo:bar:1.0:jar:test"])
        expect(CoordinateParser).to receive(:new).and_return(coordinate_parser)
        expect(coordinate_parser).to receive(:parse_scoped_coordinates).with("foo:bar:1.0:jar:test").and_return("Blah")
        expect(subject).to receive(:generate_file).exactly(3).times
        expect(subject).to receive(:create_dir)

        subject.run(project)

        expect(project.dependencies.first).to eq("Blah")
      end

      it "generates the pom file" do
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "pom.xml.erb"), "foobar/pom.xml", project)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "gitignore.erb"), "foobar/.gitignore", project)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "editorconfig.erb"), "foobar/.editorconfig", project)
        subject.run(project)
      end

      it "generates the Dockerfile if docker set to true" do
        docker_project = Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war", [], nil, [], nil, true)

        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "pom.xml.erb"), "foobar/pom.xml", docker_project)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "gitignore.erb"), "foobar/.gitignore", docker_project)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "editorconfig.erb"), "foobar/.editorconfig", docker_project)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "Dockerfile.erb"), "foobar/Dockerfile", docker_project)

        subject.run(docker_project)
      end

      it "generates the main class if main is set to true" do
        project_with_main = Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war", [], nil, [], 'App')

        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "pom.xml.erb"), "foobar/pom.xml", project_with_main)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "gitignore.erb"), "foobar/.gitignore", project_with_main)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "editorconfig.erb"), "foobar/.editorconfig", project_with_main)
        expect(subject).to receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "Main.java.erb"), "foobar/src/main/java/com/example/foobar/App.java", project_with_main)

        subject.run(project_with_main)
      end
    end
  end
end
