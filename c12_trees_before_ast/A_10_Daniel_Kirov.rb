require 'json'
require 'rubygems'

json_file = File.read("A_10_Daniel_Kirov.json")
json_parse = JSON.parse(json_file)

json_parse.each do |x, y_hash|
  puts "#{x}"
  y_hash.each do |y, name_hash|
    puts " #{y}" 
    name_hash.each do |name, value|
      puts "    #{name}"
    end
  end
end


