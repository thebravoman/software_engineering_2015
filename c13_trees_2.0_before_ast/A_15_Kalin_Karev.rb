require 'rexml/document'
include REXML

file = File.new("A_15_Kalin_Karev.xml")

xml_doc = Document.new(file)

xml_doc.root.elements.each("school") do |school|
	puts school.attributes["name"]
	
	school.elements.each("class") do |school_class|
		puts "  " + school_class.attributes["name"]
	
	school_class.elements.each("student") do |student|
		puts "    " + student.text	
	end
		
	end 
end
