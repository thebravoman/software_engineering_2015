require 'json'

content = File.read("A_14_Ignat_Georgiev.json")
parsed = Hash.new
parsed = JSON.parse(content)

parsed.each do |x, y_hash|
	puts "#{x}"
  y_hash.each do |y, name_hash|
  	puts " #{y}"
    name_hash.each do |name, value|
      puts "  #{name}"
    end
  end
end