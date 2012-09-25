require 'spec_helper'

module Mvnizer
  describe Mvnize do

    let (:project) { Project.new(nil, "quxbaz", nil, nil) }
    let (:new_project) { double("new_project") }
    let (:search) { double("search") }

    let(:coordinate_parser) { double("coordinate_parser") } 
    subject { Mvnizer::Mvnize.new(coordinate_parser) }

    before { subject.out = StringIO.new }

    it "reads the configuration" do
      options = {name: "foobar", command: "new"}
      subject.should_receive(:conf).with(options).and_return(options)

      p = Mvnizer::Project.new("group", "foobar", "version", "jar")
      coordinate_parser.should_receive(:parse).and_return(project)
      Command::ProjectFactory.should_receive(:create).and_return(new_project)
      new_project.should_receive(:run)
      
      subject.run(options)
    end

    it "creates a project from the provided coordinates" do
      options = {name: "foobar", command: "new"}

      subject.should_receive(:conf).with(options).and_return(options)
      
      p = Mvnizer::Project.new("group", "foobar", "version", "jar")
      coordinate_parser.should_receive(:parse).with("foobar").and_return(p)
      Command::ProjectFactory.should_receive(:create).and_return(new_project)
      new_project.should_receive(:run)
      
      subject.run(options)
    end

    it "chooses what command to run depending on the options" do
      options = {name: "quxbaz", command: "new"}

      subject.should_receive(:conf).and_return(Hash.new)

      p = Mvnizer::Project.new("group", "foobar", "version", "pom")
      coordinate_parser.should_receive(:parse).and_return(p)
      Command::ProjectFactory.should_receive(:create).with("pom").and_return(new_project)
      new_project.should_receive(:run)

      subject.run(options)
    end

    it "throws an error when no name is given" do
      lambda { subject.run(Hash.new) }.should raise_error(ArgumentError, "Please give a name to the project.")
    end

    it "displays a success message when done" do
      subject.should_receive(:define_project).and_return(project)
      Command::ProjectFactory.should_receive(:create).and_return(new_project)
      new_project.should_receive(:run)
# For some obscure reason, this does not work:
#      $stdout.should_receive(:write).with("Project created successfully.")
# It fails properly when message is incorrect:
#   #<IO:0x774d4142> received :write with unexpected arguments
#         expected: ("success")
#              got: ("Project created successfully.")
# But throws an error when the message is correct:
# undefined method `write' for #<IO:fd 1>
# So instead, I have to resort to adding an `out` instance variable in Mvnize:
      string_io = StringIO.new
      subject.out = string_io

      subject.run(name: "quxbaz", command: "new")
      string_io.string.should match(/success/i)
    end
   
    it "throws an error if the command to run is not valid" do
      lambda { subject.run(name: "quxbaz", command: "foobar") }.should raise_error(ArgumentError, "foobar is not a valid command.")
    end

    it "calls the search command when doing a search" do
      options = { command:"search", name: "junit" }

      Command::SearchArtefact.should_receive(:new).and_return(search)
      search.should_receive(:run).with(options)

      subject.run(options)
    end

  end
end
