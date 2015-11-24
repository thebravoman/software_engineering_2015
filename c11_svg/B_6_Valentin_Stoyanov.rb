def circle(x, y, r, color)
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="4" fill="'+color.to_s+'" />'
end

def rect(h, w, color)
	'<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)">'
end

def text x,y,contents
  '<text x="'+x.to_s+'" y="'+y.to_s+'">'+contents+'</text>'
end

File.open('result.svg', 'w') do |f|
	f.write('<svg xmlns="http://w3.org/2000/svg">')
	f.write(rect(70, 200, 'green'))
	f.write(circle(35, 35, 30, 'red'))
	f.write(circle(35, 100, 30, 'yellow'))
	f.write(circle(35, 165, 30, 'green'))
	f.write(text 10, 230, 'Valentin Stoyanov')
	f.write('</svg>')
end
