require 'nokogiri'

Then /^"([^"]+)" should not be in the xml file "([^"]+)"$/ do |xpath,path|
  in_current_dir do
    doc = Nokogiri::XML(File.open(path))
    doc.remove_namespaces!
    doc.xpath(xpath).first.should be_nil
  end
end


Then /^"([^"]+)" in the xml file "([^"]+)" should be "([^"]+)"$/ do |xpath,path,value|
  in_current_dir do
    doc = Nokogiri::XML(File.open(path))
    doc.remove_namespaces!
    doc.xpath(xpath).first.text().should == value
  end
end
