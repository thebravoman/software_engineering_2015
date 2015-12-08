require 'nokogiri'
str = File.read("B_19_Martin_Angelov.xml")

xml_parse = Nokogiri::XML(str)
puts xml_parse
