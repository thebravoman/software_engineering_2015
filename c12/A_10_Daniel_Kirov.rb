require 'json'
require 'rubygems'

json_file = File.read("A_10_Daniel_Kirov.json")
json_parse = JSON.parse(json_file)

json_parse.each do|key|
  puts key[0]
  in_hash = key[1].to_json
  hash1 = JSON.parse(in_hash)
  hash1.each do |name1|
  puts name1
end
end



