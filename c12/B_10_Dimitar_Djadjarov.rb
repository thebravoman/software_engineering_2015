require 'rubygems'
require 'json'
file = open("B_10_Dimitar_Djadjarov.json")
json = file.read
parsed = JSON.parse(json)
parsed.each do |a|
p a
end
