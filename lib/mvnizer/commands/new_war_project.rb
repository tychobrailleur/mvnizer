module Mvnizer
  module Command
    class NewWarProject < NewProject
      def run(options)
        super

        @dir_creator.create("#{@project.artifact_id}/src/main/webapp/WEB-INF")

        # web.xml is optional in Servlet 3.0
        # Do we keep its generation here?
        web_xml = File.join(File.dirname(__FILE__), '..', 'templates', 'web.xml.erb')
        FileUtils.cp(web_xml, "#{@project.artifact_id}/src/main/webapp/WEB-INF/web.xml")

        # TODO:
        # Create sample @WebServlet?
        # Add JEE dependencies into pom.
      end
    end
  end
end
