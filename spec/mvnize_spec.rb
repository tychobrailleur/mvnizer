require 'spec_helper'

module Mvnizer
  describe Mvnize do

    let (:project) { Project.new(nil, 'quxbaz', nil, nil) }
    let (:new_project) { double('new_project') }
    let (:search) { double('search') }

    let(:coordinate_parser) { double('coordinate_parser') }
    subject { Mvnizer::Mvnize.new(coordinate_parser) }

    before { subject.out = StringIO.new }

    it 'reads the configuration' do
      options = {name: 'foobar', command: 'new'}
      expect(subject).to receive(:conf).with(options).and_return(options)

      expect(coordinate_parser).to receive(:parse).and_return(project)
      expect(Command::ProjectFactory).to receive(:create).and_return(new_project)
      expect(new_project).to receive(:run)

      subject.run(options)
    end

    it 'creates a project from the provided coordinates' do
      options = {name: 'foobar', command: 'new'}

      expect(subject).to receive(:conf).with(options).and_return(options)

      p = Mvnizer::Project.new('group', 'foobar', 'version', 'jar')
      expect(coordinate_parser).to receive(:parse).with('foobar').and_return(p)
      expect(Command::ProjectFactory).to receive(:create).and_return(new_project)
      expect(new_project).to receive(:run)

      subject.run(options)
    end

    it 'chooses what command to run depending on the options' do
      options = {name: 'quxbaz', command: 'new'}

      expect(subject).to receive(:conf).and_return(Hash.new)

      p = Mvnizer::Project.new('group', 'foobar', 'version', 'pom')
      expect(coordinate_parser).to receive(:parse).and_return(p)
      expect(Command::ProjectFactory).to receive(:create).with('pom').and_return(new_project)
      expect(new_project).to receive(:run)

      subject.run(options)
    end

    it 'throws an error when no name is given' do
      expect { subject.run(Hash.new) }.to raise_error(ArgumentError, 'Please give a name to the project.')
    end

    it 'displays a success message when done' do
      expect(subject).to receive(:define_project).and_return(project)
      expect(Command::ProjectFactory).to receive(:create).and_return(new_project)
      expect(new_project).to receive(:run)
# For some obscure reason, this does not work:
#      $expect(stdout).to receive(:write).with("Project created successfully.")
# It fails properly when message is incorrect:
#   #<IO:0x774d4142> received :write with unexpected arguments
#         expected: ("success")
#              got: ("Project created successfully.")
# But throws an error when the message is correct:
# undefined method `write' for #<IO:fd 1>
# So instead, I have to resort to adding an `out` instance variable in Mvnize:
      string_io = StringIO.new
      subject.out = string_io

      subject.run(name: 'quxbaz', command: 'new')
      expect(string_io.string).to match(/success/i)
    end

    it 'throws an error if the command to run is not valid' do
      expect { subject.run(name: 'quxbaz', command: 'foobar') }.to raise_error(ArgumentError, 'foobar is not a valid command.')
    end

    it 'calls the search command when doing a search' do
      options = { command:'search', name: 'junit' }

      expect(Command::SearchArtefact).to receive(:new).and_return(search)
      expect(search).to receive(:run).with(options)

      subject.run(options)
    end

    it 'calls the add command when adding a dependency' do
      options = { command: 'add', name: 'junit' }

      expect(Command::AddDependency).to receive(:new).and_return(search)
      expect(search).to receive(:run).with(options)

      subject.run(options)
    end

    it 'adds the logging dependencies if logger is true' do
      options = { name: 'pouet', command: 'new', type: 'jar',
                  logging_deps: [ 'test:logger:1.10:jar' ], logger: true }

      expect(subject).to receive(:conf).with(options).and_return(options)
      expect(coordinate_parser).to receive(:parse).with('pouet').and_return(project)
      expect(Project).to receive(:new).and_return(new_project)

      expect(coordinate_parser).to receive(:parse_scoped_coordinates).with('test:logger:1.10:jar').and_return('hello')
      expect(new_project).to receive(:add_dependency).with('hello')
      expect(new_project).to receive(:type).and_return('typ')

      command = double('command')
      expect(Mvnizer::Command::ProjectFactory).to receive(:create).with('typ').and_return(command)
      expect(command).to receive(:run).with(new_project)
      expect(new_project).to receive(:artifact_id)

      subject.run(options)
    end

  end
end
