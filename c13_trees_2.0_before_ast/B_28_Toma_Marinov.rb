#require 'nokogiri'
require 'rexml/document'
include REXML

input_file = ARGV[0]

#document = File.open(input_file, 'r') do |file|
#	Nokogiri::XML(file)
#end

#puts document

xml_file = File.open(input_file)
xml_document = Document.new(xml_file)

xml_root = xml_document.root

spaces = 0.to_i

xml_document.elements.each("School") do |element|
	puts ""* spaces + element.attributes["name"]
end

spaces += 2

xml_document.elements.each("School/Class") do |element|
	puts " "* spaces + element.attributes["name"]
	spaces += 2
	xml_document.elements.each("School/Class/Student/name") do |element|
		puts " "* spaces + element.text
	end
end

spaces += 2

xml_document.elements.each("School/Class/Student/name") do |element|
	puts " "* spaces + element.text
end