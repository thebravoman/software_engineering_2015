require 'json'

file = File.read('A_5_Velin_Yavorski.json')

data = JSON.parse(file)

data.each do |key1, value1|
	puts key1
	value1.each do |key2, value2|
		puts "  " + key2
		value2.each do |key3, value3|
			puts "    " + key3
		end	
	end
end