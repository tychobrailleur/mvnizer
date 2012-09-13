require 'spec_helper'

describe Mvnizer::Configuration do
  include Mvnizer::Configuration
  let (:conf_path) { File.join(File.dirname(__FILE__), '..', 'conf', 'default.yml') }

  it "loads configuration from default.yml" do
      YAML.should_receive(:load_file).with(be_same_path_as(conf_path)).and_return({ foo: "bar" })
    
    config = conf(Hash.new)
    config[:foo].should == "bar"
  end

  it "should replace default values" do
      YAML.should_receive(:load_file).with(be_same_path_as(conf_path)).and_return({ foo: "bar" })
    
    config = conf({ foo: "qux", baz: "buz" })
    config[:foo].should == "qux"
    config[:baz].should == "buz"
  end

  it "should symbolize configuration keys" do
    YAML.should_receive(:load_file).with(be_same_path_as(conf_path)).and_return({ "foo" => "bar" })

    config = conf(Hash.new)
    config[:foo].should == "bar"
  end
end
