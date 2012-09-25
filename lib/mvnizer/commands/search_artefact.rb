require 'httparty'

module Mvnizer
  module Command
    class SearchArtefact
      include HTTParty
      MAVEN_REPO_SEARCH_URL = "http://search.maven.org/solrsearch/select?q=:q&rows=:limit&wt=json"

      attr_writer :out
      def out
        @out ||= STDOUT
      end

      def run(options)
        url = MAVEN_REPO_SEARCH_URL.dup
        url[":q"] = options[:name]
        url[":limit"] = "5"

        response = self.class.get(url)
        if response
          if response.code != 200
            out.puts "Error during search: #{response.code}"
            exit(1)
          end

          if response["response"]["numFound"].to_i > 0
            hits = response["response"]["docs"].each do |a|
              out.puts "  #{a['g']}:#{a['a']}:#{a['latestVersion']}:#{a['p']}"
            end
          else
            out.puts "  No result found."
          end
        end

        # TODO:
        # Error handling,
        # Do something for "bundle" packaging (e.g. for log4j)
      end
    end
  end
end
