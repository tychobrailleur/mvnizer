$:.unshift File.dirname(__FILE__)

require 'erb'

require 'mvnizer/version'
require 'mvnizer/erb_helper'
require 'mvnizer/project'
require 'mvnizer/configuration'
require 'mvnizer/commands'
require 'mvnizer/coordinate_parser'
require 'mvnizer/pom_generator'
require 'mvnizer/dir_creator'
require 'mvnizer/mvnize'


