def circle(x, y, r, col)
	' <circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="'+col+'" />'
end

def ellipse(x, y)
	'<ellipse cx="'+x.to_s+'" cy="'+y.to_s+'" rx="100" ry="50" style="fill:yellow;stroke:purple;stroke-width:2" />'
end 

def writeName(x, y)
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="red">Nikolay Rangelov, 11A</text>'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg" height="1000" width="1000">')
	f.write(circle 400, 400, 30, 'red')
	f.write(ellipse 500, 500)
	f.write(circle 500, 400, 30, 'green')
	f.write(circle 650, 500, 30, 'blue')
	f.write(circle 500, 700, 30 , 'orange')
	f.write(circle 400, 400, 30, 'yellow')
	f.write(circle 600, 400, 30, 'green')
	#f.write(circle 400, 400, 30)
	f.write(writeName 70, 100)
	f.write('</svg>')
end