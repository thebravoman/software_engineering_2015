
def circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="red" />'
end

def elipse x,y,rx,ry, color
	'<ellipse cx="'+x.to_s+'" cy="'+y.to_s+'" rx="'+rx.to_s+'" ry="'+ry.to_s+'" 
	style="fill:'+color.to_s+';stroke:purple;stroke-width:2" />'
end

def text x, y, cont
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+cont.to_s+'</text>'
end
File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	#f.write('<circle cx="100" cy="100" r="40" stroke="black" stroke-width="3" fill="red" />')
	f.write(circle 140,130,40)
	f.write(elipse 220,130,40,20, "blue")
	f.write(elipse 60,130,40,20, "yellow")
	f.write(elipse 140,210,20,40, "orange")
	f.write(elipse 140,50,20,40, "green")
	f.write(text 110, 300, 'Martin Dimitrov')
	f.write('</svg>')
end