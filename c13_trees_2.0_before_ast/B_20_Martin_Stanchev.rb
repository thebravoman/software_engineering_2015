require 'nokogiri'

content = File.read("B_20_Martin_Stanchev.xml")

doc = Nokogiri::XML(content)
puts doc



