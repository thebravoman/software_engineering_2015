def gime_a_circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="green" stroke-width="4" fill="yellow" />'
end

def rectange x,y,w,h
  '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(gime_a_circle 30,30,30)
	f.write(gime_a_circle 40,40,10)
	f.write(rectange 10,10,10,10)
	f.write('</svg>')
end
