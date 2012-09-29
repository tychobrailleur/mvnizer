$:.unshift File.dirname(__FILE__)

require 'erb'

require 'mvnizer/version'
require 'mvnizer/exceptions'
require 'mvnizer/erb_helper'
require 'mvnizer/task_helper'
require 'mvnizer/project'
require 'mvnizer/configuration'
require 'mvnizer/commands'
require 'mvnizer/coordinate_parser'
require 'mvnizer/mvnize'

