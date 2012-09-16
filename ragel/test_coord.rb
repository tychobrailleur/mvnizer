require 'coordinate'

Mvnizer::CoordinateLexer.new.scan("com.weblogism:name")
puts "---"
Mvnizer::CoordinateLexer.new.scan("name:jar")
