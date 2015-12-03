require 'rexml/document'
include REXML

xml=File.open("A_18_Metodi_Ilchev.xml")
hash=Document.new(xml)
hash.root.elements.each{|e|
	puts e.attributes["name"]
}
