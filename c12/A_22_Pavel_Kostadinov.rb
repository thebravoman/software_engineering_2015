require 'json'

json_file = File.read("A_22_Pavel_Kostadinov.json")
parse_json = JSON.parse(json_file)

parse_json.each do |key, value|
	
	p key
        value.each do |k,v|
        p  k 
        p  v
        end
end
