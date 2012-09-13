require 'spec_helper'
require 'nokogiri'

describe Mvnizer::PomGenerator do
  subject { Mvnizer::PomGenerator.new }

  it "generates a pom" do
    options = { group_id: "test", version: "1.0.0-SNAPSHOT", name: "mvnizer" }
    output = subject.generate(options)

    # TODO: Ain't that a bit overkill for test?
    doc = Nokogiri::XML(output)
    doc.remove_namespaces!
    doc.xpath("/project/groupId").first.text().should == "test"
    doc.xpath("/project/artifactId").first.text().should == "mvnizer"
    doc.xpath("/project/version").first.text().should == "1.0.0-SNAPSHOT"
    doc.xpath("/project/name").first.text().should == "mvnizer"
  end
end
