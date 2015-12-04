require 'rexml/document'

def parse_xml(xml, level)
	xml.elements.to_a.each do |element|
		puts "#{' '*(level*3)}#{element.attributes['name']}"
		unless element.elements.empty?
			parse_xml(element, level+1)
		end
	end
end

file = ARGV[0]
xml_file = File.read file
xml = REXML::Document.new(xml_file)
parse_xml(xml, 0)
