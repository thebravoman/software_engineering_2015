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

@current_width = 100
def print_svg_tree_dfs(printer, node, svg, current_width, h)
	if not node.is_a? Hash
		#TODO: FIX THIS
		return
	end
	
	level_start_width = current_width
	children_count = 0
	node.each do |key, value|
		if key == "children"
			value.each do |nested_object|
				children_count += 1;
				print_svg_tree_dfs(printer, nested_object, svg, @current_width , h + 180)
				#@current_width += 100
				@current_width += 180
				/if !nested_object["children"]
					svg << printer.print_circle(w, h)
				end/
			end
		end
	end
	
	if !(node["children"])
		svg << printer.print_circle(@current_width , h)
		#p node["node_name"] + " at " + current_width.to_s + " " + h.to_s
		text_width = @current_width - 70
		svg << printer.print_text(text_width, h, node["node_name"])
		printer.print_text(text_width, h, node["node_name"])
	else
		current_node_print_width = (@current_width - 180 + level_start_width) / 2
		svg << printer.print_circle(current_node_print_width , h)
		text_width = current_node_print_width - 70
		svg << printer.print_text(text_width, h, node["node_name"])
		#p node["node_name"] + " at " + current_node_print_width.to_s + " " + h.to_s
	end
	
	
end

class SvgPrinter
	def print_circle(w, h)
		return '<circle cx="' + w.to_s + '" cy="' + h.to_s + '" r="80" stroke="black" stroke-width="3" fill="red" />'
	end
	
	def print_text(width, height, text)
		return '<text x="' + width.to_s + '" y="' + height.to_s + '">' + text.to_s + '</text>'
	end
end

def print_svg(parsed_data)
	File.open("B_27_Radostin_Angelov.svg", "w") do |svg|
		svg << '<svg xmlns="http://www.w3.org/2000/svg" height="3000" width="1000">'
		print_svg_tree_dfs(SvgPrinter.new, parsed_data, svg, 0, 200)
		svg << '</svg>'
	end
end

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

result = parse_json(path)
print_svg(result)
print_tree(result, " ", 0)
#result = parse_xml(path)