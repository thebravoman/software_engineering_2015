def circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" fill="red" />'
end

def base x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" fill="yellow" />'
end

def rectange x,y,w,h
  '<rect width="'+w.to_s+'" height="'+h.to_s+'" x="'+x.to_s+'" y="'+y.to_s+'" style="fill:green;"/>'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">') 
	
	f.write(base 150,155, 50)
	f.write(rectange 150, 230, 10, 250)
	
	
	f.write(circle 50, 130,50)
	f.write(circle 150, 50,50)
	f.write(circle 250, 130,50)
	f.write(circle 70, 230,50)
	f.write(circle 230, 230,50)
	
	
	f.write('<text x="250" y="50" font-weight="bold" fill="black">Georgi Danchev 11a #9</text>')
	f.write('</svg>')
end