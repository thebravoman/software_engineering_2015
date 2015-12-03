require 'nokogiri'

content = File.read("A_10_Daniel_Kirov.xml")

doc = Nokogiri::XML(content)
puts doc


