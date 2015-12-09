require 'json'

class SvgDrawer
	def begin
		"<svg xmlns=\"http://www.w3.org/2000/svg\">"
	end
	def end
		"</svg>"
	end
	def circle(x, y, r)
		"<circle cx=\"#{x.to_s}\" cy=\"#{y.to_s}\" r=\"#{r.to_s}\" fill=\"red\" stroke=\"black\"/>"
	end
	def line(x1, y1, x2, y2)
		"<line x1=\"x1.to_s\" y1=\"y.to_s\" x2=\"x2.to_s\" y2=\"y2.to_s\" stroke=\"black\" stroke-width=\"2\"/>"
	end
	def rect(x, y, w, h)
		"<rect x=\"#{x.to_s}\" y=\"#{y.to_s}\" width=\"#{w.to_s}\" height=\"#{h.to_s}\" fill=\"green\" stroke=\"black\"/>"
	end
	def text(x, y, text)
		"<text x=\"#{x.to_s}\" y=\"#{y.to_s}\" fill=\"black\" text-anchor=\"middle\">#{text}</text>"
	end
end

class SvgGenerator
	private

	SCREEN_WIDTH = 1000

	def draw_element(element, depth, at_this_level, total_levels)
		puts element
		@@arr ||= Array.new(total_levels, 0)
		@@arr[depth] += 1
		num = @@arr[depth]
		d = SCREEN_WIDTH / (at_this_level+1)
		r = 50
		cx = num*d
		cy = depth*3*r + r
		out = String.new
		out << SvgDrawer.new.circle(cx,cy,r)
		out << SvgDrawer.new.text(cx, cy, element)
	end

	def json_get_levels(arr, element, depth=0)
		while arr.size <= depth
			arr << 0
		end
		if element.class == Hash
			element.each do |key, value|
				json_get_levels(arr, value, depth)
			end
		elsif element.class == Array
			element.each do |el|
				json_get_levels(arr, el, depth+1)
			end
		else
			arr[depth] += 1
		end
	end

	def parse_json(levels, element, depth=0)
		output = String.new;
		if element.class == Hash
			element.each do |key, value|
				output << parse_json(levels, value, depth)
			end
		elsif element.class == Array
			elements = element.size
			element.each do |el|
				output << parse_json(levels, el, depth+1)
			end
		else
			#puts "#{' '*depth*2} #{element} : #{levels[depth].to_s}"
			output << draw_element(element, depth, levels[depth], levels.size)
		end
		output
	end

	public
	def generate_from_json(json)
		levels = Array.new
		json_get_levels(levels, json)
		output = String.new;
		output << SvgDrawer.new.begin;
		output << parse_json(levels,json)
		output << SvgDrawer.new.end;
		output
	end
end

OUTPUT_FILE = 'A_23_Petko_Georgiev.svg'

input_file = ARGV.first
file = File.read input_file

json = JSON.parse file

File.open(OUTPUT_FILE, 'w') do |file|
	file << SvgGenerator.new.generate_from_json(json)
end
