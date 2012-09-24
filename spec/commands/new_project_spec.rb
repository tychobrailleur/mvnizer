require 'spec_helper'


module Mvnizer
  module Command
    describe NewProject do
      let(:options) { { name: "foobar", group_id: "com.example", version: "1.0.0", type: "jar" } }
      let(:project) { Mvnizer::Project.new(nil, "foobar", nil, nil) }

      let(:coordinate_parser) { double("coordinate_parser") } 
      subject { Mvnizer::Command::NewProject.new(coordinate_parser) }

      it "reads the configuration" do
        coordinate_parser.should_receive(:parse).and_return(project)
        subject.should_receive(:conf).with(options).and_return(options)
        subject.should_receive(:generate_file)

        subject.run(options)
      end

      it "creates a project from the provided coordinates" do
        o = { name: "foobar"}

        subject.should_receive(:conf).with(o).and_return(options)
        subject.should_receive(:generate_file)

        p = Mvnizer::Project.new("group", "foobar", "version", "type")
        coordinate_parser.should_receive(:parse).with("foobar").and_return(p)

        subject.run(o)
      end

      it "creates the project directory" do
        subject.should_receive(:conf).with(options).and_return(options)
        coordinate_parser.should_receive(:parse).and_return(project)
        subject.should_receive(:generate_file)
        subject.should_receive(:create_dir).with("foobar/src/main/java", "foobar/src/test/java")

        subject.run(options)
      end

      it "generates the pom file" do
        p = Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war")

        subject.should_receive(:conf).with(options).and_return(options)
        coordinate_parser.should_receive(:parse).and_return(p)
        subject.should_receive(:generate_file).with(File.join(TaskHelper::TEMPLATE_DIR, "pom.xml.erb"), 
                                                    "foobar/pom.xml", p)
        subject.run(options)
      end
    end
  end
end
