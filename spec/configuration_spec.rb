require 'spec_helper'

describe Mvnizer::Configuration do
  include Mvnizer::Configuration
  let (:conf_path) { File.join(File.dirname(__FILE__), '..', 'conf', 'default.yml') }

  it "loads configuration from default.yml" do
      expect(YAML).to receive(:load_file).with(be_same_path_as(conf_path)).and_return({ foo: "bar" })

    config = conf(Hash.new)
    expect(config[:foo]).to eq("bar")
  end

  it "should replace default values" do
      expect(YAML).to receive(:load_file).with(be_same_path_as(conf_path)).and_return({ foo: "bar" })

    config = conf({ foo: "qux", baz: "buz" })
    expect(config[:foo]).to eq("qux")
    expect(config[:baz]).to eq("buz")
  end

  it "should symbolize configuration keys" do
    expect(YAML).to receive(:load_file).with(be_same_path_as(conf_path)).and_return({ "foo" => "bar" })

    config = conf(Hash.new)
    expect(config[:foo]).to eq("bar")
  end
end
