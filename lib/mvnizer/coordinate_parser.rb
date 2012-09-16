module Mvnizer 
  class CoordinateParser
    def parse(coordinates)
      p  = nil
      coordinates.scan(/(([a-zA-Z][\w\.\-]+):)?([a-zA-Z][\w\.\-]+)(:(\d+\.\d+\.\d(\-\w+)?))?(:(war|jar|pom))?/) do
        |i,g,a,v0,v,m,t0,t|
        p = Project.new(g, a, v, t)
      end

      p
    end
  end
end
