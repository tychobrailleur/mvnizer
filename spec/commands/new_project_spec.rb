require 'spec_helper'


module Mvnizer
  module Command
    describe NewProject do
      let(:options) { { name: "foobar", group_id: "com.example", version: "1.0.0", type: "jar" } }
      let(:project) { Mvnizer::Project.new(nil, "foobar", nil, nil) }

      let(:generator) { double("generator") }
      let(:coordinate_parser) { double("coordinate_parser") } 
      let(:dir_creator) { double("dir_creator") }
      subject { Mvnizer::Command::NewProject.new(generator, dir_creator, coordinate_parser) }

      before do
        FakeFS.activate!
        FileUtils.mkdir_p("foobar")
      end

      it "reads the configuration" do
        generator.should_receive(:generate)
        coordinate_parser.should_receive(:parse).and_return(project)
        dir_creator.should_receive(:create)
        subject.should_receive(:conf).with(options).and_return(options)

        subject.run(options)
      end

      it "creates a project from the provided coordinates" do
        o = { name: "foobar"}

        subject.should_receive(:conf).with(o).and_return(options)
        generator.should_receive(:generate)
        dir_creator.should_receive(:create)

        p = Mvnizer::Project.new("group", "foobar", "version", "type")
        coordinate_parser.should_receive(:parse).with("foobar").and_return(p)

        subject.run(o)
      end

      it "creates the project directory" do
        subject.should_receive(:conf).with(options).and_return(options)
        coordinate_parser.should_receive(:parse).and_return(project)
        generator.should_receive(:generate)
        dir_creator.should_receive(:create).with("foobar/src/main/java", "foobar/src/test/java")

        subject.run(options)
      end

      it "generates the pom file" do
        p = Mvnizer::Project.new("com.example", "foobar", "1.0.0-SNAPSHOT", "war")

        subject.should_receive(:conf).with(options).and_return(options)
        coordinate_parser.should_receive(:parse).and_return(p)
        generator.should_receive(:generate).with(p)
        dir_creator.should_receive(:create)
        subject.run(options)

        File.exists?("foobar/pom.xml").should be_true
      end

      after do 
        FileUtils.rm_rf("foobar")
        FakeFS.deactivate!
      end
    end
  end
end
