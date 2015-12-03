require 'rexml/document'


file = REXML::Document.new(File.open("B_21_Martin_Galabov.xml"))

def foo(elements, offset)
elements.each do |element|
puts " "*offset + element.name+ "=" +element.attributes.to_s

 foo(element.elements, offset+5)
  end
end
  
foo(file.elements, 0)
