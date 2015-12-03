require 'rexml/document'

xml_data = File.read('A_09_Georgi_Danchev.xml')

xml_doc = REXML::Document.new(xml_data)

def xml_parser(xml_doc, offset = 0)
  xml_doc.elements.each do |elem|
    if elem.attributes['name']
      puts ' '*offset + elem.attributes['name']
      offset += 2
    end
    elem.elements.each do |sub|
      puts ' '*(offset)+ sub.attributes['name']
      xml_parser(sub, offset + 2)
    end
  end
end

xml_parser(xml_doc)
