# encoding: utf-8
module Mvnizer
  module Command
    class ProjectFactory
      def self.create(type)
        case type
        when "jar"
          return NewProject.new
        when "war"
          require 'mvnizer/commands/new_war_project'
          return NewWarProject.new
        else
          raise ArgumentError, "Don’t know how to create #{type}."
        end
      end
    end
  end
end

