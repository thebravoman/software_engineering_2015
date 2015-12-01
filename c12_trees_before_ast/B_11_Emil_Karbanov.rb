require 'rubygems'
require 'json'
file = open("B_11_Emil_Karbanov.json")
json = file.read
parsed = JSON.parse(json)
parsed.each do |a|
p a
end
