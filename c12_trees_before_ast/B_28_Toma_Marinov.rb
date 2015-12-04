require 'json'

<<<<<<< HEAD
hash = Hash.new(0)
json_file = File.read('B_14_Ivo_Gerginov.json')
=======
input_file = ARGV[0]
>>>>>>> 520c39f66734e333f2a0e632b5906f626e157b59

json_file = File.read(input_file)
hash = JSON.parse(json_file)

spaces = 0.to_i

def print_json_tree(hash, spaces)
	hash.each do |key, value|
		puts ' '*spaces + key

		if value.kind_of?(Hash)
			print_json_tree(value, spaces + 2)
		elsif value.kind_of?(Array)
			value.each do |elem|
				print_json_tree(elem, spaces + 2)
			end
		end
	end
end

print_json_tree(hash, spaces)
