require 'spec_helper'


module Mvnizer
  module Command
    describe SearchArtefact do

      subject { SearchArtefact.new }
      before { subject.out = StringIO.new }

      def httparty_response_mock(mock_response_content)
        request_object = HTTParty::Request.new Net::HTTP::Get, '/'
        response_object = Net::HTTPOK.new('1.1', 200, 'OK')
        response_object.stub(:body => mock_response_content)
        mock_response = HTTParty::Response.new(request_object, response_object, -> { mock_response_content })
      end

      def response_mock(klass)
        response = klass.new('', '', '')
        response.stub(:body)
        response
      end
      
      it "performs a search in the Maven repository" do
        options = { command:"search", name: "junit" }
        SearchArtefact.should_receive(:get).with("http://search.maven.org/solrsearch/select?q=junit&rows=5&wt=json")

        subject.run(options)
      end

      it "displays the coordinates of the found artefacts" do
        require 'json'

        mock_response_content = JSON.parse(<<JSON)
{
    "response": {
        "numFound": "1",
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

        mock_response = httparty_response_mock(mock_response_content)
        options = { command:"search", name: "junit" }
        SearchArtefact.should_receive(:get).and_return(mock_response)

        io = StringIO.new
        subject.out = io

        subject.run(options)

        io.string.should =~ Regexp.new("blah:blah:1.0:jar")
      end


      it "displays an informative message when no result is found" do
        mock_response_content = '{ "response": { "numFound": "0"} }'
        mock_response = httparty_response_mock(mock_response_content)
        
        options = { command:"search", name: "junit" }
        SearchArtefact.should_receive(:get).and_return(mock_response)
        
        io = StringIO.new
        subject.out = io
        
        subject.run(options)
        
        io.string.should match("No result found.")
      end

      it "displays an error message when something went wrong" do
        net_response = response_mock(Net::HTTPServerError)
        SearchArtefact.should_receive(:get).and_return(net_response)

        options = { command:"search", name: "junit" }
        io = StringIO.new
        subject.out = io
        
        lambda { subject.run(options) }.should raise_error(SystemExit)
        
        io.string.should match("Error during search: ")
      end
    end
  end
end


