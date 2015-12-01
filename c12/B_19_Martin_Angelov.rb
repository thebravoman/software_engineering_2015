require 'rubygems'
require 'json'

path = ARGV[0]

json = ''

file = File.open(path)
  file.each_line do |line|
  json += line
end

parsed = JSON.parse(json)

parsed.each do |result|
  p result
end	
