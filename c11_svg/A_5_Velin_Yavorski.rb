def circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="red" />'
end

def ycircle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="yellow" />'
end


File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(ycircle 110, 110, 30)
	f.write(circle 40,40,30)
	f.write(circle 110,40,30)
	f.write(circle 180,40,30)
	f.write(circle 40,110,30)
	f.write(circle 40,180,30)
	f.write(circle 110,180,30)
	f.write(circle 180, 180, 30)
	f.write(circle 180, 110, 30)
	f.write('</svg>')
end
