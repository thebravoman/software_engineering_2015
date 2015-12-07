require 'json'
require 'pp'
require 'rubygems'
reader = File.read("B_21_Martin_Galabov.json")
data = JSON.parse(reader)
data.keys.each do |key|
  p data[key]["name"]
  p data[key]["classes"]
 end
 pp data

