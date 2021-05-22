require 'spec_helper'

describe Mvnizer::CoordinateParser do
  subject { Mvnizer::CoordinateParser.new }

  describe "#parse" do
    it "can read the project name" do
      project = subject.parse("name")
      expect(project.artifact_id).to eq("name")
    end

    it "can read the group and artifact ids" do
      project = subject.parse("com.example:name")
      expect(project.artifact_id).to eq("name")
      expect(project.group_id).to eq("com.example")
    end

    it "can read the group and artifact ids and version and type" do
      project = subject.parse("com.example:name:1.0.0-rc2:war")
      expect(project.artifact_id).to eq("name")
      expect(project.group_id).to eq("com.example")
      expect(project.version).to eq("1.0.0-rc2")
      expect(project.type).to eq("war")
    end

    it "can read the group and artifact ids and version" do
      project = subject.parse("com.example:name:1.0.0-rc2")
      expect(project.artifact_id).to eq("name")
      expect(project.group_id).to eq("com.example")
      expect(project.version).to eq("1.0.0-rc2")
    end

    it "can read the artifact id and version" do
      project = subject.parse("name:1.0.0-SNAPSHOT")
      expect(project.artifact_id).to eq("name")
      expect(project.version).to eq("1.0.0-SNAPSHOT")
    end

    it "can read the artifact id and type" do
      project = subject.parse("name:jar")
      expect(project.artifact_id).to eq("name")
      expect(project.type).to eq("jar")
    end

    it "can read the artifact id, version and type" do
      project = subject.parse("name:1.0.0-rc2:war")
      expect(project.artifact_id).to eq("name")
      expect(project.version).to eq("1.0.0-rc2")
      expect(project.type).to eq("war")
    end
  end

  describe "#parse_scoped_coordinates" do
    it "can parse the scope" do
      project = subject.parse_scoped_coordinates("name:1.0.0-rc2:war:runtime")
      expect(project.artifact_id).to eq("name")
      expect(project.scope).to eq("runtime")

      project = subject.parse_scoped_coordinates("com.weblogism:name:1.0.0-rc2:jar:runtime")
      expect(project.artifact_id).to eq("name")
      expect(project.scope).to eq("runtime")
    end

    it "can parse the junit dependency" do
      project = subject.parse_scoped_coordinates("junit:junit:4.10:jar:test")
      expect(project.group_id).to eq("junit")
      expect(project.artifact_id).to eq("junit")
      expect(project.version).to eq("4.10")
      expect(project.type).to eq("jar")
      expect(project.scope).to eq("test")
    end

    it "can parse the java EE dependency" do
      project = subject.parse_scoped_coordinates("javax:javaee-web-api:6.0:jar:provided")
      expect(project.group_id).to eq("javax")
      expect(project.artifact_id).to eq("javaee-web-api")
      expect(project.version).to eq("6.0")
      expect(project.type).to eq("jar")
      expect(project.scope).to eq("provided")

    end

    it "can parse a dependency without scope" do
      project = subject.parse_scoped_coordinates("junit:junit:4.10:jar")
      expect(project.group_id).to eq("junit")
      expect(project.artifact_id).to eq("junit")
      expect(project.version).to eq("4.10")
      expect(project.type).to eq("jar")
      expect(project.scope).to be_nil
    end
  end
end
