def gime_a_circle x, y, z, color

			'<circle cx ="'+x.to_s+'" cy = "'+y.to_s+'" r = "'+z.to_s+'" stroke = "green"
				stroke-width = "4" fill="'+color.to_s+'" />'
end

def gime_a_rectangle w, h, color
	'<rect width =  "'+w.to_s+'" height= "'+h.to_s+'" style = "'+color.to_s+'; stroke-width:3;stroke:rgb(0,0,0)"/>'

end

def write_a_text w, h, color, content
	'<text x="'+w.to_s+'" y="'+h.to_s+'" fill="'+color.to_s+'">'+content.to_s+'</text>'
	
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns = "http://www.w3.org/2000/svg">')

	f.write(gime_a_rectangle(100, 230, "black"))
	f.write(gime_a_circle(50, 40, 30, "red"))
	f.write(gime_a_circle(50, 110, 30, "yellow"))
	f.write(gime_a_circle(50, 180, 30, "green"))
	f.write(write_a_text(0, 248, "green", "Martin Stanchev"))

	f.write('</svg>')
end