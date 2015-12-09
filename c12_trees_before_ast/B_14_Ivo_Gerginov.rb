require 'json'

def printJSON(hash, tabs) 
  hash.each do |key, value|
    puts ' '*tabs + key
    if value.kind_of?(Hash)
	  printJSON(value, tabs + 1)
	elsif value.kind_of?(Array)
	  value.each do |e|
	    puts ' '*tabs + e.to_s
	  end
	end
  end
end

data = Hash.new()
file = File.read('B_14_Ivo_Gerginov.json')
data = JSON.parse(file)

printJSON(data, 0.to_i)