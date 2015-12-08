require 'json'
require 'pp'
a = File.read(ARGV[0])

result = JSON.parse(a)


def draw_circle x, y, r, color, text
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="'+color.to_s+'" />
	 <text x="'+(x - 5*text.length).to_s+'" y="'+y.to_s+'" fill="back">'+text.to_s+'</text>'
end
x = 100
x2 = 200
File.open("B_25_Petyo_Cvetkov.svg", "w") do |svg|
  svg.write('<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="600">')
	svg.write(draw_circle 500, 100, 100, "red", result["node_name"])
	result["children"].each do |classes|
		puts classes["node_name"]

			svg.write(draw_circle x2, 300, 100, "red", classes["node_name"])
      x2 +=500

		classes["children"].each do |students|
			puts students["node_name"]
				svg.write(draw_circle x, 500, 50, "red", students["node_name"])
        x += 100
			end
      x += 150
			end



	svg.write('</svg>')
end
