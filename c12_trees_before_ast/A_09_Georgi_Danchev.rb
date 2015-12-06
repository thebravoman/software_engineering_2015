require 'json'

class TreeMap
	def self.parse_json(element, offset = 0)
		spaces = ' ' * offset
	
		if(element.class == Hash)
		element.each do |key, value|
			if(value.class == Hash || value.class == Array)
			parse_json value, offset + 1
			else
			puts "#{spaces}#{value}"
			end
		end
		elsif(element.class == Array)
		element.each do |e|
			parse_json e, offset + 1
		end
		else
		puts "#{spaces}#{element}"
		end
	end
  
	def self.create_svg(element)
		if(element.class == Hash)
		element.each do |key, value|
			if(value.class == Hash || value.class == Array)
			create_svg value
			else
			puts "#{spaces}#{value}"
			end
		end
		elsif(element.class == Array)
		element.each do |e|
			create_svg e
		end
		else
		puts "#{spaces}#{element}"
		end
	end
end

file = File.read "A_09_Georgi_Danchev.json"
json = JSON.parse file
TreeMap.parse_json json
