require 'json'
#IT DOESN'T WORK!!!!!!
f = File.open('B_6_Valentin_Stoyanov.json', 'r')
content = File.read(f)
my_hash = JSON.parse(content)

def print(offset, json)
	json.each do |res|
		key = res[0]
		value = res[1]
		for i in 0..offset + key.to_i
			puts ' '
		end
		if value == Hash
			print(value, offset + 2)
		elsif Array
			value.each do |v|
				for i in 0..((offset + 2) + v)
					puts ' '
				end
			end
		end
	end
end

print(0, my_hash)

