require 'rubygems'
require 'json'
string = '{"School": {
		"Classes": {
			"11A": [{
				"Student1":"Bojidar",
				"Student2":"Ivan"
			}],
			"11B": [{
				"Student1":"Valio",
				"Student2":"Ivan"
			}]

		}
	}
}'

json = ''
string.each_line do |line|
	json += line
end
parsed = JSON.parse(json)
parsed.each do |result|
	p result
end	
