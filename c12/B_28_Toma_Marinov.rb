require 'json'

hash = Hash.new(0)
json_file = File.read('B_14_Ivo_Gerginov.json')

hash = JSON.parse(json_file)
spaces = 0.to_i
#hash.to_h
#p hash

def print_json_tree another_hash, tabs
	#p another_hash
	#hash = hash.to_h
	another_hash.each do |key, value|
		puts ' ' * tabs + key

		if another_hash.kind_of?(Hash)
			print_json_tree value, tabs + 2
		elsif another_hash.kind_of?(Array)
			value.each do |element|
				puts ' ' * tabs + 2 + element
			end
		end
	end
end

print_json_tree hash, spaces