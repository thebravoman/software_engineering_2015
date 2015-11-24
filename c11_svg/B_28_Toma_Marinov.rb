def gime_a_circle x,y,r,colour
	'<svg width="400" height="300">
		<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="4" fill="'+colour.to_s+'"/>
	</svg>'
end

def rectangle x, y, w, h
	'<svg width="'+x.to_s+'" height="'+y.to_s+'">
		<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0, 0, 0);stroke-width:3;stroke:rgb(0,0,0)"/>
	</svg>'
end

File.open('result.svg', 'w') do |f|
	#f.write('<!DOCTYPE html><html><body>')
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rectangle 400, 300, 100, 300)
	f.write(gime_a_circle 40, 40, 40, 'red')
	f.write(gime_a_circle 40, 140, 40, 'yellow')
	f.write(gime_a_circle 40, 240, 40, 'green')
	f.write('</svg>')
	#f.write('</body></html>')
end