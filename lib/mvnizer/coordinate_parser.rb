module Mvnizer 
  class CoordinateParser
    def parse(coordinates)
      p  = nil
      # When no group and type is given
      if coordinates =~ /\A([a-zA-Z][\w\.\-]+)(:(\d+\.\d+\.\d(\-\w+)?))?:(war|jar|pom)(:(test|compile|provided|runtime|system|import))?/
        p = Project.new(nil, $1, $3, $5, [], $7)
      else
        coordinates.scan(/(([a-zA-Z][\w\.\-]+):)?([a-zA-Z][\w\.\-]+)(:(\d+\.\d+\.\d(\-\w+)?))?(:(war|jar|pom))?(:(test|compile|provided|runtime|system|import))?/) do
          |i,g,a,v0,v,m,t0,t,s0,s|
          p = Project.new(g, a, v, t, [], s)
        end
      end

      p
    end
  end
end
