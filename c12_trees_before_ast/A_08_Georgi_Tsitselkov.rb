require 'json'

json = ''

input = File.read('A_08_Georgi_Tsitselkov.json')
output = JSON.parse(input)

def print_hashmap(output, offset)
	output.each do |key, value|
		puts ' '*offset + key
	case value
	when Hash
		print_hashmap(value, offset + 2)
	when Array		
	value.each do |v|
		puts ' '*(offset + 2) + v
		end
	end
	end
end
print_hashmap(output, 0)
