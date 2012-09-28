require 'spec_helper'

describe Mvnizer::CoordinateParser do
  subject { Mvnizer::CoordinateParser.new }

  describe "#parse" do
    it "can read the project name" do
      project = subject.parse("name")
      project.artifact_id.should == "name"
    end

    it "can read the group and artifact ids" do
      project = subject.parse("com.example:name")
      project.artifact_id.should == "name"
      project.group_id.should == "com.example"
    end

    it "can read the group and artifact ids and version and type" do
      project = subject.parse("com.example:name:1.0.0-rc2:war")
      project.artifact_id.should == "name"
      project.group_id.should == "com.example"  
      project.version.should == "1.0.0-rc2"
      project.type.should == "war"
    end

    it "can read the group and artifact ids and version" do
      project = subject.parse("com.example:name:1.0.0-rc2")
      project.artifact_id.should == "name"
      project.group_id.should == "com.example"  
      project.version.should == "1.0.0-rc2"
    end

    it "can read the artifact id and version" do
      project = subject.parse("name:1.0.0-SNAPSHOT")
      project.artifact_id.should == "name"
      project.version.should == "1.0.0-SNAPSHOT"
    end

    it "can read the artifact id and type" do
      project = subject.parse("name:jar")
      project.artifact_id.should == "name"
      project.type.should == "jar"
    end

    it "can read the artifact id, version and type" do
      project = subject.parse("name:1.0.0-rc2:war")
      project.artifact_id.should == "name"
      project.version.should == "1.0.0-rc2"
      project.type.should == "war"
    end
  end

  describe "#parse_scoped_coordinates" do
    it "can parse the scope" do
      project = subject.parse_scoped_coordinates("name:1.0.0-rc2:war:runtime")
      project.artifact_id.should == "name"
      project.scope.should == "runtime"

      project = subject.parse_scoped_coordinates("com.weblogism:name:1.0.0-rc2:jar:runtime")
      project.artifact_id.should == "name"
      project.scope.should == "runtime"
    end

    it "can parse the junit dependency" do
      project = subject.parse_scoped_coordinates("junit:junit:4.10:jar:test")
      project.group_id.should == "junit"
      project.artifact_id.should == "junit"
      project.version.should == "4.10"
      project.type.should == "jar"
      project.scope.should == "test"
    end

    it "can parse the java EE dependency" do
      project = subject.parse_scoped_coordinates("javax:javaee-web-api:6.0:jar:provided")
      project.group_id.should == "javax"
      project.artifact_id.should == "javaee-web-api"
      project.version.should == "6.0"
      project.type.should == "jar"
      project.scope.should == "provided"

    end

    it "can parse a dependency without scope" do
      project = subject.parse_scoped_coordinates("junit:junit:4.10:jar")
      project.group_id.should == "junit"
      project.artifact_id.should == "junit"
      project.version.should == "4.10"
      project.type.should == "jar"
      project.scope.should be_nil
    end
  end
end
