require "rexml/document"

file = File.read("file.xml")

xml_doc = REXML::Document.new(file)

def  
xml_doc.elements.each do |element|
	element.attributes.each do |key, value|
		puts key
		puts value
	end
end


