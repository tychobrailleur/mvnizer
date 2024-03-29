require_relative 'lib/mvnizer/version'

Gem::Specification.new do |s|
  s.name = "mvnizer"
  s.version = Mvnizer::Version::STRING

  s.require_paths = ["lib"]
  s.authors = ["S\u{e9}bastien Le Callonnec"]
  s.date = "2021-11-12"
  s.description = "Generate a Maven project with pre-defined values, including pom file, gitignore, and more."
  s.email = "sebastien@weblogism.com"
  s.executables = ["mvnizer"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.org"
  ]
  s.files  = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.homepage = "http://github.com/tychobrailleur/mvnizer"
  s.licenses = ["MIT"]
  s.required_ruby_version = '>= 2.7.0'
  s.rubygems_version = "2.7.8"
  s.summary = "Bootstrap a Maven project without the pain of archetypes."
end
