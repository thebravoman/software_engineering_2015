def circle(x, y, color, r)
	 '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="'+color.to_s+'" stroke-width="4" fill="'+color.to_s+'" />'
end

def rectangle(x, y, h, w)
	 '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end 

File.open("result.svg","w") do |f|
f.write('<svg xmlns="http://www.w3.org/2000/svg">')
f.write(rectangle 0,0,200,80)
f.write(circle 40,40,'red',25)
f.write(circle 40,100,'yellow',25)
f.write(circle 40,160,'green',25)
f.write('</svg>')
end
