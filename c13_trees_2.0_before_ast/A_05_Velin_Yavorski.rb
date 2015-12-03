require 'rexml/document'
include REXML

xml_file = File.open('A_05_Velin_Yavorski.xml')
xml_document = Document.new(xml_file)

xml_root = xml_document.root

xml_document.elements.each("School") do |school|
	puts school.attributes["name"]

	school.elements.each("Class") do |classes|
	puts "  " + classes.attributes["name"]
		classes.elements.each("Student") do |student|
			puts "    "  + student.text
		end
	end
end
