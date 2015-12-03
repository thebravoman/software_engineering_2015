require 'nokogiri'
require 'rexml/document'

file = File.read(ARGV[0]) 

xml = REXML::Document.new file


def xml_parser(xml_doc)
	text = ''
 	tab = 2
 
 	xml_doc.elements.each do |elem|
 		text = elem.attributes['name'] || elem.text
 	  
  		if elem.attributes['name']
      		puts ' '*tab + elem.attributes['name']
      		tab +=2

  		else text.strip != ''
 		 	#puts text
  		end

  		xml_parser(elem)
  	end
end

xml_parser(xml)

#puts xml