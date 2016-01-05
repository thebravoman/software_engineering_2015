require 'rexml/document'

xml_data = File.read('B_26_Plamen_Neshkov.xml')

xml_doc = REXML::Document.new(xml_data)

def foo(xml_doc, offset = 0)
  xml_doc.elements.each do |elem|
    if elem.attributes['name']
      puts ' '*offset + elem.attributes['name']
      offset += 2
    end
    elem.elements.each do |sub|
      puts ' '*(offset)+ sub.attributes['name']
      foo(sub, offset + 2)
    end
  end
end

foo(xml_doc)
