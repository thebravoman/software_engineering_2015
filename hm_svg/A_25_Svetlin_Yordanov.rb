require 'json'
require 'rubygems'

json_file = File.open("A_25_Svetlin_Yordanov.json")
json = json_file.read
json_parsed = JSON.parse(json)

svg_file = File.open("A_25_Svetlin_Yordanov.svg")

count = 1
count2 = 1

def draw_circle x, y, r, fill, text
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="'+fill.to_s+'" />
	 <text x="'+(x - 5*text.length).to_s+'" y="'+y.to_s+'" fill="back">'+text.to_s+'</text>'
end

def draw_rect
	
end

def draw_tree
end

File.open("A_25_Svetlin_Yordanov.svg", "w") do |svg|
	svg.write('<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="600">')
	svg.write(draw_circle 500, 100, 100, "red", json_parsed["node_name"])
	json_parsed["children"].each do |classes|
		puts classes["node_name"]
		if count == 1
			svg.write(draw_circle 300, 300, 100, "orange", classes["node_name"])
		elsif count == 2
			svg.write(draw_circle 700, 300, 100, "orange", classes["node_name"])
		end
		classes["children"].each do |students|
			puts students["node_name"]
			if count2 == 1
				svg.write(draw_circle 150, 500, 50, "orange", students["node_name"])
			elsif count2 == 2
				svg.write(draw_circle 250, 500, 50, "orange", students["node_name"])
			elsif count2 == 3
				svg.write(draw_circle 350, 500, 50, "orange", students["node_name"])
			end
				
			count2 = count2 + 1
		end
		count = count + 1
	end
	
	
	svg.write('</svg>')
end