def circle x,y,r	
	'<circle cx="' + x.to_s + '" cy="' + y.to_s + '" r="' + r.to_s + '" stroke="black" stroke-width="3" fill="purple" />'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write('<rect width="55" height="55" x="95" y="95" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"> </rect>')
	#f.write('<circle cx="170" cy="170" r="40" stroke="black" stroke-width="3" fill="purple" />')
	#f.write(circle(170,350,30))
	f.write(circle(67,105,30))	
	f.write(circle(120,70,30))
	f.write(circle(173,100,30))
	f.write(circle(167,160,30))	
	f.write(circle(125,173,30))
	f.write(circle(78,165,30))
	f.write( '<text x="100" y="250" fill="red">Emil Lozev</text>')
	f.write('</svg>')
end
