def circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'"+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="red" />'
end

def rectangle x, y, w, h
		'<rect width="'+w.to_s+'" height="'+h.to_s+'" x="'+x.to_s+'" y ="'+y_to.s+'" style="fill:gsb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)" />'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	
	f.write(rectangle 100,100, 100, 100)
	f.write(circle 150,50, 50, 255, 255, 0)
	f.write(circle 50, 50, 50, 153, 255, 102)
	f.write(circle 50, 150, 50, 255, 102)
	f.write(circle 50, 250, 50, 124, 255, 27, 45)
	
	f.write('<text x="600" y="500" fill="black">Kalin Karev</text>')
	
	f.write('</svg>')
end
