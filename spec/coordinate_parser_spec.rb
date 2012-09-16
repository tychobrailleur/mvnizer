require 'spec_helper'

describe Mvnizer::CoordinateParser do
  subject { Mvnizer::CoordinateParser.new }

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
end
