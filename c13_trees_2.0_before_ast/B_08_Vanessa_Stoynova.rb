require 'nokogiri'

file = Nokogiri::XML(File.open("B_08_Vanessa_Stoynova.xml"))

puts file
