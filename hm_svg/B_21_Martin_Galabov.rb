require 'json'
input = ARGV[0]
x = 550
y = 100
box_x = 100
box_y = 500
def draw_circle x, y, text
	'<circle cx ="'+x.to_s+'" cy = "'+y.to_s+'" r = "50" stroke = "black" stroke-width = "2" fill="yellow" />
	<text x="'+(x-20).to_s+'" y="'+(y+5).to_s+'" fill="black" font-size = "20pt">'+text.to_s+'</text>'
end

def draw_line x1, y1, x2, y2
'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" stroke = "black" stroke-width = "2" />'
end

def draw_rectangle x, y, text
	'<rect  x = "'+x.to_s+'" y= "'+y.to_s+'" width = "100" height = "50" style="fill:white;stroke-width:1;stroke:black"/>
	<text x="'+(x+10).to_s+'" y="'+(y+30).to_s+'" fill="black" font-size = "20pt">'+text.to_s+'</text>'
end

json_file = File.read(input)
parsed_json = JSON.parse(json_file)
File.open("B_21_Martin_Galabov.svg", "w") do |file|
	file.write('<svg xmlns="http://www.w3.org/2000/svg">')
	parsed_json.each do |key, value|                                                           
		if key == 'node_name'
			file.write(draw_circle(x, y, value))
			file.write(draw_line(x, y + 50, x - 200, y + 200))
			file.write(draw_line(x, y + 50, x + 200, y + 200))
			y += 100
		else
			x -= 100
			value.each do |grade|
				grade.each do |c, childs|
					if c == 'node_name'
						file.write(draw_circle(x - 100, y + 100, childs))
						x += 400
					elsif c == 'children'
						childs.each do |names|
							names.each do |name_key, name_value|
								file.write(draw_rectangle(box_x,box_y,  name_value))
								file.write(draw_line(x - 500, y + 150, box_x + 50, box_y ))
								box_x += 200
							end
						end
					end
				end
			end
		end
	end
	file.write('</svg>')
end
