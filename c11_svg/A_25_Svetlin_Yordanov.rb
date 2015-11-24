def circle x, y, r, cr, cg, cb
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="red" style="fill:rgb('+cr.to_s+', '+cg.to_s+', '+cb.to_s+')"/>'
end

def rect x, y, w, h
	'<rect width="'+w.to_s+'" height="'+h.to_s+'" x="'+x.to_s+'" y="'+y.to_s+'" style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)" />'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	
	f.write(rect 100, 100, 100, 100)
	f.write(circle 150, 50, 50, 255, 255, 0)
	f.write(circle 50, 50, 50, 153, 255, 102)
	f.write(circle 50, 150, 50, 255, 27, 45)
	f.write(circle 50, 250, 50, 124, 255, 10)
	f.write(circle 150, 250, 50, 250, 45, 38)
	f.write(circle 250, 250, 50, 255, 255, 243)
	f.write(circle 250, 150, 50, 179, 24, 0)
	f.write(circle 250, 50, 50, 102, 205, 140)
	
	f.write('<text x="15" y="355" fill="black">Svetlin Yordanov</text>')
	
	f.write('</svg>')
end
