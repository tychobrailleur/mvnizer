module Mvnizer 
  class CoordinateParser
    # Parse the coordinates of an artifact.
    def parse(coordinates)
      p  = nil
      # When no group and type is given
      if coordinates =~ /\A([a-zA-Z][\w\.\-]+)(:(\d+\.\d+\.\d(\-\w+)?))?:(war|jar|pom)/
        p = Project.new(nil, $1, $3, $5)
      else
        coordinates.scan(/(([a-zA-Z][\w\.\-]+):)?([a-zA-Z][\w\.\-]+)(:(\d+\.\d+\.\d(\-\w+)?))?(:(war|jar|pom))?/) do
          |i,g,a,v0,v,m,t0,t|
          p = Project.new(g, a, v, t)
        end
      end

      p
    end

    # Parse the coordinates of a dependency, i.e. that include
    # the scope (test, compile, provided, runtime, system or import)
    def parse_scoped_coordinates(coordinates)
      p  = nil
      if coordinates =~ /\A(([a-zA-Z][\w\.\-]+):)?([a-zA-Z][\w\.\-]+)(:(\d+\.\d+(\.\d)?(\-\w+)?))?:(war|jar|pom):(test|compile|provided|runtime|system|import)/
        p = Project.new($2, $3, $5, $8, [], $9)
      end
      p
    end
  end
end
