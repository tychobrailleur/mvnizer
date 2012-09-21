require 'spec_helper'

module Mvnizer
  describe Mvnize do

    let (:new_project) { double("new_project") }
    subject { Mvnizer::Mvnize.new }

    it "chooses what command to run depending on the options" do
      options = {name: "quxbaz", command: "new"}
      Command::ProjectFactory.should_receive(:create).and_return(new_project)
      new_project.should_receive(:run).with(options)
      subject.run(options)
    end

    it "throws an error when no name is given" do
      lambda { subject.run(Hash.new) }.should raise_error(ArgumentError, "Please give a name to the project.")
    end

    it "displays a success message when done" do
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

    it "performs war tasks if name ends with :war" do
      options = {name: "quxbaz:war", command: "new"}
      Command::ProjectFactory.should_receive(:create).with("war").and_return(new_project)
      new_project.should_receive(:run).with(options)
      subject.run(options)
    end
    
    it "throws an error if the command to run is not valid" do
      lambda { subject.run(name: "quxbaz", command: "foobar") }.should raise_error(ArgumentError, "foobar is not a valid command.")
    end

  end
end
