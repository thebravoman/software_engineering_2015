def circle x,y,rad,r,g,b
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+rad.to_s+'"
	style="fill:rgb('+r.to_s+','+g.to_s+','+b.to_s+');stroke-width=4;stroke:rgb(0,0,0)"/>'
end
def rectangle w,h
  '<rect width="'+w.to_s+'" height="'+h.to_s+'"
  style="fill:rgb(50,50,50);stroke-width:3;stroke:rgb(0,0,0)"/>'
end
def text text,x,y
'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+text+'</text>'
end
File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rectangle 50,150)
	f.write(circle 25,125,20,255,0,0)
	f.write(circle 25,75,20,150,150,100)
	f.write(circle 25,25,20,100,150,100)
	f.write(text "Petar Tsankov Tsankov Xb N22",10,175)
	f.write('</svg>')
end
