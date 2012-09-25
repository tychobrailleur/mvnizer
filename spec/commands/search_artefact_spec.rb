require 'spec_helper'


module Mvnizer
  module Command
    describe SearchArtefact do

      subject { SearchArtefact.new }
      before { subject.out = StringIO.new }
      
      it "performs a search in the Maven repository" do
        options = { command:"search", name: "junit" }
        SearchArtefact.should_receive(:get).with("http://search.maven.org/solrsearch/select?q=junit&rows=5&wt=json")

        subject.run(options)
      end

      it "displays the coordinates of the found artefacts" do
        require 'json'

        mock_response = JSON.parse(<<JSON)
{
    "response": {
        "docs": [
            {
                "g": "blah",
                "a": "blah",
                "latestVersion": "1.0",
                "p": "jar"
            }
        ]
    }
}
JSON

        options = { command:"search", name: "junit" }
        SearchArtefact.should_receive(:get).and_return(mock_response)

        io = StringIO.new
        subject.out = io

        subject.run(options)

        io.string.should =~ Regexp.new("blah:blah:1.0:jar")
      end
    end

  end
end


