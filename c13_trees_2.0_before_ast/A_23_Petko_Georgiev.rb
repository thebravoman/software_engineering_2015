require 'rexml/document'

def parse_xml(xml)
	xml.elements.to_a.each do |element|
		puts "#{element.attributes['name']}"
		unless element.elements.empty?
			parse_xml element
		end
	end
end

file = ARGV[0]
xml_file = File.read file
xml = REXML::Document.new(xml_file)
parse_xml xml