def gime_a_circle x,y,r, color
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="2" fill="'+color.to_s+'" />'
end

def rectange w,h ##missing x and y
  '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(255,255,0);stroke-width:5;stroke:rgb(0,0,0)"/>'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rectange 75,150)
	f.write(gime_a_circle 35,25,25, "red")
	f.write(gime_a_circle 35,80,25, "yellow")
	f.write(gime_a_circle 35,130,25, "green")
	f.write('</svg>')
end
