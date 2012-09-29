module Mvnizer
  module Command
    class AddDependency
      include TaskHelper

      def run(options)
        raise Mvnizer::FileNotFoundError, "The pom.xml file cannot be found." unless pom_present?
        
        dependency = options[:name]
        content = add_dependency([dependency])
        File.open("pom.xml", "w") do |f|
          f.write(content)
        end
      end

      private
      def pom_present?
        File.exists?(File.join(Dir.pwd, "pom.xml"))
      end
    end
  end
end
