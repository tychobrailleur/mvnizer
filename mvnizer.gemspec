# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: mvnizer 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mvnizer"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["S\u{e9}bastien Le Callonnec"]
  s.date = "2015-07-04"
  s.description = "Bootstrap a Maven project without the pain of archetypes."
  s.email = "sebastien@weblogism.com"
  s.executables = ["mvnizer"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".rspec",
    "CHANGELOG.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "TODO.md",
    "bin/mvnizer",
    "conf/default.yml",
    "features/new_project.feature",
    "features/search_artefact.feature",
    "features/step_definitions/pom_steps.rb",
    "features/support/env.rb",
    "lib/mvnizer.rb",
    "lib/mvnizer/commands.rb",
    "lib/mvnizer/commands/add_dependency.rb",
    "lib/mvnizer/commands/new_project.rb",
    "lib/mvnizer/commands/new_war_project.rb",
    "lib/mvnizer/commands/project_factory.rb",
    "lib/mvnizer/commands/search_artefact.rb",
    "lib/mvnizer/configuration.rb",
    "lib/mvnizer/coordinate_parser.rb",
    "lib/mvnizer/erb_helper.rb",
    "lib/mvnizer/exceptions.rb",
    "lib/mvnizer/mvnize.rb",
    "lib/mvnizer/project.rb",
    "lib/mvnizer/task_helper.rb",
    "lib/mvnizer/templates/_dependency.xml.erb",
    "lib/mvnizer/templates/pom.xml.erb",
    "lib/mvnizer/templates/war/ExampleServlet.java.erb",
    "lib/mvnizer/templates/war/index.jsp.erb",
    "lib/mvnizer/templates/web.xml.erb",
    "lib/mvnizer/version.rb",
    "mvnizer.gemspec",
    "ragel/coordinate.rb",
    "ragel/coordinate.rl",
    "ragel/test_coord.rb",
    "spec/commands/add_dependency_spec.rb",
    "spec/commands/new_project_spec.rb",
    "spec/commands/new_war_project_spec.rb",
    "spec/commands/project_factory_spec.rb",
    "spec/commands/search_artefact_spec.rb",
    "spec/configuration_spec.rb",
    "spec/coordinate_parser_spec.rb",
    "spec/dummy.txt.erb",
    "spec/dummy_pom.xml",
    "spec/mvnize_spec.rb",
    "spec/project_spec.rb",
    "spec/spec_helper.rb",
    "spec/task_helper_spec.rb"
  ]
  s.homepage = "http://github.com/tychobrailleur/mvnizer"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Bootstrap a Maven project without the pain of archetypes."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_development_dependency(%q<rspec-mocks>, ["~> 2.11.2"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.4.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<aruba>, ["~> 0.4.11"])
    else
      s.add_dependency(%q<httparty>, ["~> 0.9.0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6.6"])
      s.add_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_dependency(%q<rspec-mocks>, ["~> 2.11.2"])
      s.add_dependency(%q<fakefs>, ["~> 0.4.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<aruba>, ["~> 0.4.11"])
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.9.0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6.6"])
    s.add_dependency(%q<rspec>, ["~> 2.11.0"])
    s.add_dependency(%q<rspec-mocks>, ["~> 2.11.2"])
    s.add_dependency(%q<fakefs>, ["~> 0.4.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<aruba>, ["~> 0.4.11"])
  end
end

