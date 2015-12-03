require 'rexml/document'

def parse_xml(xml, depth = 0)
  spaces = ' ' * depth

  xml.elements.to_a.each do |element|
    puts "#{spaces}#{element.attributes['name']}"
    
    if element.elements.size > 0
      parse_xml element, depth + 2
    end
  end
end

file = ARGV[0]
xml_file = File.read file
xml = REXML::Document.new(xml_file)
parse_xml(xml.elements[1])
