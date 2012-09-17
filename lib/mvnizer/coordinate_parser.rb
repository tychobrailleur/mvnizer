module Mvnizer 
  class CoordinateParser
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
  end
end
