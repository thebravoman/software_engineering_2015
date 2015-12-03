require 'rexml/document'
require 'nokogiri'

file = Nokogiri::XML(File.open("B_21_Martin_Galabov.xml")) do |config|
  config.options = Nokogiri::XML::ParseOptions::NOENT
end
puts file


