def circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="pink" />'
end

def rect x, y, width, height
	'<rect width="'+width.to_s+'" height="'+height.to_s+'" x="'+x.to_s+'" y="'+y.to_s+'" style="fill:rgb(250,250,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end

def text1 x, y
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">Kristiana Ivanova</text>'
end

def text2 x, y
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">Victoria Admasu</text>'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(circle(30, 30, 30));
	f.write(circle(95, 30, 30));
	f.write(circle(30, 90, 30));
	f.write(circle(95, 90, 30));
	f.write(rect(40, 40, 50, 40));
	f.write(text1(120, 120));
	f.write(text2(140, 140));
	f.write('</svg>')

end
