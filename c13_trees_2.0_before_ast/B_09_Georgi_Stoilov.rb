require 'nokogiri'
#file = File.open("B_09_Georgi_Stoilov.xml") { |f| Nokogiri::XML(f) }

file = Nokogiri::XML(File.open("B_09_Georgi_Stoilov.xml"))

puts file
