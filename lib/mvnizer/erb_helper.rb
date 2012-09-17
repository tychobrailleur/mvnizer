module Mvnizer

  # ERB utilities that needs to be brought into a class
  # used as an ERB binding.
  module Erbicole
    # Path to folder storing all templates.
    TEMPLATE_PATH = File.join(File.dirname(__FILE__), 'templates')

    # Renders a template named `name` located in the templates
    # folder.
    def render(name)
      content = File.read(File.join(TEMPLATE_PATH, name))
      ERB.new(content).result(binding)
    end

    # Return the ERB binding.
    def get_binding
      binding
    end
  end
end
