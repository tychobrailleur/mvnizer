require 'spec_helper'

describe Mvnizer::Mvnize do
  let(:generator) { double("generator") }
  subject { Mvnizer::Mvnize.new(generator) }

  before { FakeFS.activate! }

  it "reads the configuration" do
    options = { name: "foobar" }
    generator.should_receive(:generate)
    subject.should_receive(:conf).with(options).and_return(options)

    subject.run(options)
  end

  it "creates the project directory" do
    options = { name: "foobar" }
    subject.should_receive(:conf).with(options).and_return(options)
    generator.should_receive(:generate)
    subject.run(options)

    File.exists?("foobar/src/main/java").should be_true
    File.exists?("foobar/src/test/java").should be_true
  end

  it "generates the pom file" do
    options = { name: "foobar" }
    subject.should_receive(:conf).with(options).and_return(options)
    generator.should_receive(:generate).with(options)
    subject.run(options)

    File.exists?("foobar/pom.xml").should be_true
  end

  after { FakeFS.deactivate! }
end
