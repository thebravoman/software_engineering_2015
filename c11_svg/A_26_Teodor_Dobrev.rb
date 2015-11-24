def circle x,y,r
	'<circle cx="'+x.to_s+'" cy"'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="red" />'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write('<rect width="300" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)">')
	f.write(circle 50,60,60)
	f.write(circle 30,40,30)
	f.write(circle 20,30,30)
	f.write(circle 40,60,30)
	f.write(circle 40,65,30)
	f.write('</svg>')
end