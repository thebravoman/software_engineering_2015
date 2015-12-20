require 'json'

path = ARGV[0]

SVG_CIRCLE_RADIUS = 60
SVG_NODE_MARGIN = 10
SVG_INITIAL_HEIGHT = 200
SVG_INITIAL_WIDTH = 0
TERMINAL_OFFSET_INCREMENT = 4
FILE_NAME = "B_27_Radostin_Angelov.svg"
SVG_VIEW = '<svg xmlns="http://www.w3.org/2000/svg" height="3000" width="3000">'

class FileParser
	def parse_json path
		structure = ""
		File.open(path, "r")  do |file|
			file.each_line do |line|
				structure += line
			end
		end
		
		result = JSON.parse(structure)
	end
end

class SvgTreePrinter
	def initialize
		@current_width = SVG_CIRCLE_RADIUS * 2+ SVG_NODE_MARGIN
	end

	def print_svg_tree_dfs(printer, node, svg, current_width, h)
		if not node.is_a? Hash
			return
		end
		
		level_start_width = current_width
		children_count = 0
		node.each do |key, value|
			if key == "children"
				value.each do |nested_object|
					children_count += 1;
					print_svg_tree_dfs(printer, nested_object, svg, @current_width , h + SVG_CIRCLE_RADIUS * 2 + SVG_NODE_MARGIN)
					@current_width += SVG_CIRCLE_RADIUS * 2 + SVG_NODE_MARGIN
				end
			end
		end
		
		text_width = 0
		if !(node["children"])
			svg << printer.print_circle(@current_width , h)
			text_width = @current_width - (SVG_CIRCLE_RADIUS - 5)
			printer.print_text(text_width, h, node["node_name"])
		else
			current_node_print_width = (@current_width - SVG_CIRCLE_RADIUS * 2 + level_start_width) / 2
			svg << printer.print_circle(current_node_print_width , h)
			text_width = current_node_print_width - (SVG_CIRCLE_RADIUS - 5)
		end
		
		svg << printer.print_text(text_width, h, node["node_name"])
	end

	class SvgPrinter
		def print_circle(w, h)
			return '<circle cx="' + w.to_s + '" cy="' + h.to_s + '" r="' + SVG_CIRCLE_RADIUS .to_s + '" stroke="black" stroke-width="3" fill="red" />'
		end
		
		def print_text(width, height, text)
			return '<text x="' + width.to_s + '" y="' + height.to_s + '">' + text.to_s + '</text>'
		end
	end

	def print_svg(parsed_data)
		File.open(FILE_NAME, "w") do |svg|
			svg << SVG_VIEW
			print_svg_tree_dfs(SvgPrinter.new, parsed_data, svg, SVG_INITIAL_WIDTH, SVG_INITIAL_HEIGHT)
			svg << '</svg>'
		end
	end
end

def terminal_print_tree(json, offset, count)
	json.each do |key, value|
		p offset * count + key
		if (value.is_a? String or value.is_a? Numeric)
			p offset * (count + TERMINAL_OFFSET_INCREMENT) + value.to_s
			
		elsif
			value.each do |object|
				terminal_print_tree(object, offset, count + TERMINAL_OFFSET_INCREMENT)
			end	
		end
	end
end

printer = SvgTreePrinter.new
parser = FileParser.new
result = parser.parse_json(path)
printer.print_svg(result)
terminal_print_tree(result, " ", 0)