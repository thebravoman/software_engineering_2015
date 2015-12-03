require 'json'

json = File.read('A_01_Aleksandar_Velinov.json')
parsedJSON = JSON.parse(json)

school = parsedJSON['school']

puts "#{school['name']}"

school["class"].each do |c|
	puts "- #{c["name"]}"
	c["students"].each do |s|
		puts "-- #{s["name"]} #{s["number"]}"
	end
end
