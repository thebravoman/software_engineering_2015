require 'nokogiri'

file = Nokogiri::XML(File.open(ARGV[0]))

puts file
