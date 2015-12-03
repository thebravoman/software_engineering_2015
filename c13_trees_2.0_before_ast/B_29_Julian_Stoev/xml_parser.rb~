require "rexml/document"

file = File.read("file.xml")

xml_doc = REXML::Document.new(file)

xml_doc.elements.each.attributes do |element|
	puts element
end
