require 'spec_helper'
require 'nokogiri'

# TODO Refactor when dealing with packaging-specific tasks.
describe Mvnizer::PomGenerator do

  let (:project) { Mvnizer::Project.new("test", "mvnizer", "1.0.0-SNAPSHOT", "jar")}
  subject { Mvnizer::PomGenerator.new }

  it "generates a pom" do
    output = subject.generate(project)

    # TODO: Ain't that a bit overkill for test?
    doc = Nokogiri::XML(output)
    doc.remove_namespaces!
    doc.xpath("/project/groupId").first.text().should == "test"
    doc.xpath("/project/artifactId").first.text().should == "mvnizer"
    doc.xpath("/project/version").first.text().should == "1.0.0-SNAPSHOT"
    doc.xpath("/project/name").first.text().should == "mvnizer"
    doc.xpath("/project/packaging").first.should be_nil
  end

  it "adds the packaging when the type is not jar" do
    project = Mvnizer::Project.new("test", "mvnizer", "1.0.0", "war")
    output = subject.generate(project)

    doc = Nokogiri::XML(output)
    doc.remove_namespaces!
    doc.xpath("/project/packaging").first.text().should == "war"
  end

  it "adds the dependencies" do
    dependency = Mvnizer::Project.new("junit", "junit", "4.8.2", "jar", [], "test")
    project.add_dependency(dependency)
    output = subject.generate(project)

    doc = Nokogiri::XML(output)
    doc.remove_namespaces!
    doc.xpath("/project/dependencies/dependency/groupId").first.text().should == "junit"
    doc.xpath("/project/dependencies/dependency/artifactId").first.text().should == "junit"
    doc.xpath("/project/dependencies/dependency/version").first.text().should == "4.8.2"
    doc.xpath("/project/dependencies/dependency/scope").first.text().should == "test"
  end
end
