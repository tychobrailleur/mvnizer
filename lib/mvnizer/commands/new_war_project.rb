module Mvnizer
  module Command
    class NewWarProject < NewProject
      def run(project)
        super

        create_dir("#{project.artifact_id}/src/main/webapp/WEB-INF")

        # web.xml is optional in Servlet 3.0
        # Do we keep its generation here?
        generate_file(File.join(TEMPLATE_DIR, "web.xml.erb"),
                      "#{project.artifact_id}/src/main/webapp/WEB-INF/web.xml",
                      project)


        # The Java class will be generated in the groupId/artifactId folder
        # with the dots replaced by path separators.
        # FIXME: packages containing dashes will break
        target_directory = "#{project.group_id}.#{project.artifact_id}".gsub(/\./, File::SEPARATOR)

        generate_file(File.join(TEMPLATE_DIR, "war", "ExampleServlet.java.erb"),
                      "#{project.artifact_id}/src/main/java/#{target_directory}/ExampleServlet.java",
                      project)
        generate_file(File.join(TEMPLATE_DIR, "war", "index.jsp.erb"),
                      "#{project.artifact_id}/src/main/webapp/WEB-INF/index.jsp",
                      project)
      end

      def get_dependencies
        ["javax:javaee-web-api:6.0:jar:provided"]
      end
    end
  end
end
