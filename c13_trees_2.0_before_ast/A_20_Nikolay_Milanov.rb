require 'nokogiri'
#file = File.open("A_20_Nikolay_Milanov.xml") { |f| Nokogiri::XML(f) }

file = Nokogiri::XML(File.open("A_20_Nikolay_Milanov.xml"))

puts file
