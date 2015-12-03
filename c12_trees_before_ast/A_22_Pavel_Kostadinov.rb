require 'json'

json_file = File.read("A_22_Pavel_Kostadinov.json")
parse_json = JSON.parse(json_file)

parse_json.each do |x, y_hash|
puts "#{x}"
  y_hash.each do |y, name_hash|
  puts "  #{y}"
    name_hash.each do |name|
      puts "	#{name}"
      
    end
  end
end
