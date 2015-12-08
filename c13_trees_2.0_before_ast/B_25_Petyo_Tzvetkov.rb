require 'nokogiri'
str = File.read("B_25_Petyo_Tzvetkov.xml")

xml_parse = Nokogiri::XML(str)
hash = Hash.from_xml(xml_parse)
puts xml_parse
