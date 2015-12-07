require 'json'
structure = '{
	"name" : "TUES",
	"classes" : [
		{
			"index" : "A",
			"people" : [
				{"name" : "pesho", "age" : 7, "status" : "failure"},
				{"name" : "gosho", "age" : 4, "status" : "einstein"}
			]
		},
		{
			"index" : "B",
			"people" : [
				{"name" : "pesho", "age" : 7, "status" : "failure"},
				{"name" : "gosho", "age" : 4, "status" : "einstein"}
			]
		}
	]
}'

=begin
File.open("B_27_Radostin_Angelov.json", "r")  do |file|
	file.each_line do |line|
		structure += line
	end
end
=end

def print_tree(json, offset, count)
	json.each do |key, value|
		p offset * count + key
		if (value.is_a? String or value.is_a? Numeric)
			p offset * (count + 4) + value.to_s
			
		elsif
			value.each do |object|
				print_tree(object, offset, count + 4)
			end	
		end
		
	end
end

result = JSON.parse(structure)

print_tree(result, " ", 0)

def print_svg(json, svg, w, h)
	json.each do |key, value|
		svg << '<circle cx="' + w.to_s + '" cy="' + h.to_s + '" r="40" stroke="black" stroke-width="3" fill="red" />'
		if (value.is_a? String or value.is_a? Numeric)
			svg <<  '<rect x="' + (w +100).to_s+ '" y="' + (h + 50).to_s + '" width="50" height="50"/>'
			
		elsif
			value.each do |object|
				h = h + 100
				print_svg(object, svg, w, h)
			end	
		end
	end
end

File.open("result.svg", "w") do |svg|
	svg << '<svg height="1000" width="1000">'
	print_svg(result, svg, 500, 200)
	svg << '</svg>'
end

