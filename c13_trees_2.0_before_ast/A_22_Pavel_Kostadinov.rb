require 'nokogiri'

doc = File.open("A_22_Pavel_Kostadinov.xml") { |f| Nokogiri::XML(f) }

