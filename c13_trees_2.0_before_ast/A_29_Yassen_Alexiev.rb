require 'rexml/document'

file_xml = File.read('A_29_Yassen_Alexiev.xml')
xml = REXML::Document.new(file_xml)

def foo(xml, offset = 0)
  xml.elements.each do |elem|
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

foo(xml)
