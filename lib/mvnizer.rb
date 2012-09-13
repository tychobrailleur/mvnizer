$:.unshift File.dirname(__FILE__)

require 'mvnizer/configuration'
require 'mvnizer/pom_generator'
require 'mvnizer/dir_creator'
require 'mvnizer/mvnize'

module Mvnizer
  VERSION = '0.0.1'

  # Default values
  DEFAULT = {}
end
