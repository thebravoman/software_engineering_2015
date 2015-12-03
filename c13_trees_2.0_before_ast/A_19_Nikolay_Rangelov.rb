require 'rexml/document'
include REXML

xml_file = File.new("A_19_Nikolay_Rangelov.xml");
xml_doc = Document.new(xml_file);

xml_doc.root.elements.each do |school|
	puts school.attributes["name"]

	school.elements.each do |school_class|
		puts "- " + school_class.attributes["name"]
		school_class.elements.each do |student|
			puts "-- " + student.text
		end
	end
end