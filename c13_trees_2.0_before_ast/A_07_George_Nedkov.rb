require 'nokogiri'
doc = File.open("A_07_George_Nedkov.xml") { |f| Nokogiri::XML(f) }
puts doc
