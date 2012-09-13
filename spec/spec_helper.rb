$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'mvnizer'
require 'rspec/mocks'
require 'rspec/expectations'
require 'fakefs/safe'

RSpec::Matchers.define :be_same_path_as do |expected|
  match do |actual|
    Pathname.new(expected).cleanpath == Pathname.new(actual).cleanpath
  end
end
