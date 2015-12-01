require 'json'

file = File.read('B_14_Ivo_Gerginov.json')
data = JSON.parse(file)

data.keys.each do |x|
	puts "Hello"
end