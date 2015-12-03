require 'rubygems'
require 'json'

file = open("tree.json")
json = file.read

parsed = JSON.parse(json)

parsed.each do |a|
	p a
end
