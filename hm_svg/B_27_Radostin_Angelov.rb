require 'json'
require 'rexml/document'
require 'nokogiri'

path = ARGV[0]

def parse_json path
	structure = ""
	File.open(path, "r")  do |file|
		file.each_line do |line|
			structure += line
		end
	end
	
	result = JSON.parse(structure)
end

def parse_xml path
	doc = REXML::Document.new path
	doc.elements.each("inventory/section") { |element| puts element.attributes["name"] }
end

#result = parse_json(path)
result = parse_xml(path)
p result

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

#print_tree(result, " ", 0)

#uses BFS needs to use DFS
def print_svg_tree(json, svg, w, h)
	if json.is_a? String or json.is_a? Numeric or json.nil?
		return
	end
	
	json.each do |key, value|
		if key == "node_name"
			svg << '<circle cx="' + w.to_s + '" cy="' + h.to_s + '" r="40" stroke="black" stroke-width="3" fill="red" />'
			p key + " : " + value + " height: " + h.to_s + " width: " + w.to_s
		elsif key == "children"
			old_width = w
			if value.count == 1
				p "value.count = 1"
				value.each do |nested_object|
					#@height = @height + 100 printing children of this node
					print_svg(nested_object, svg, w, h + 100)
					w = w + 100
					#p nested_object
				end
			elsif value.count > 1
				p "value.count > 1"
				left_children_count = value.count / 2
				w = w - (100 * left_children_count)
				for i in 1..left_children_count
					p i
					print_svg_tree(value[i], svg, w, h + 100)
					w = w + 100
				end
				
				#next_child = left_children_count  + 1
				w = old_width + 100
				for i in left_children_count ..value.count
					p "right"
					print_svg_tree(value[i], svg, w, h + 100)
					w = w + 100
				end
			end
		end
	end
end

def print_svg
	File.open("result.svg", "w") do |svg|
		svg << '<svg xmlns="http://www.w3.org/2000/svg" height="3000" width="1000">'
		print_svg_tree(result, svg, 500, 200)
		svg << '</svg>'
	end
end