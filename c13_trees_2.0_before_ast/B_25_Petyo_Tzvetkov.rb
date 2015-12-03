require 'nokogiri'
str = File.read("B_25_Petyo_Tzvetkov.xml")

xml_parse = Nokogiri::XML(str)
puts xml_parse
