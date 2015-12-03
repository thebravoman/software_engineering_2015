require 'nokogiri'

doc = File.open(ARGV[0]) { |f| Nokogiri::XML(f) }
puts doc
