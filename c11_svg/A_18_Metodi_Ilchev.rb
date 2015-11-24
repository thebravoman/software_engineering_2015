

def ellipse(x,y,w,h)
	cols=["purple","yellow","red","blue","green","cyan","lime"]
	cols.shuffle!
	return '<ellipse cx="'+x.to_s+'" cy="'+y.to_s+'" rx="'+w.to_s+'" ry="'+h.to_s+'" style="fill:'+cols.first+';stroke:purple;stroke-width:2"></ellipse>'
end
File.open("result.svg","w") do 
|f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write('<text x="0" y="15" fill="black">Metodi Ilchev 11 A</text>')
	f.write('<rect x="100" y="200" width="100" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"></rect>')
	f.write(ellipse(50,150,50,50))
	f.write(ellipse(150,150,50,50))
	f.write(ellipse(250,150,50,50))
	f.write(ellipse(50,250,50,50))
	f.write(ellipse(250,250,50,50))
	f.write(ellipse(50,350,50,50))
	f.write(ellipse(150,350,50,50))
	f.write(ellipse(250,350,50,50))
	
	f.write('</svg>')
end

