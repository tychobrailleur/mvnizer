module Mvnizer
  module Command
    class NewWarProject < NewProject
      def run(options)
        super

        create_dir("#{@project.artifact_id}/src/main/webapp/WEB-INF")

        # web.xml is optional in Servlet 3.0
        # Do we keep its generation here?
        generate_file(File.join(TEMPLATE_DIR, "web.xml.erb"), 
                      "#{@project.artifact_id}/src/main/webapp/WEB-INF/web.xml",
                      @project)


        # TODO:
        # Create sample @WebServlet?
        # Add JEE dependencies into pom.
      end
    end
  end
end
