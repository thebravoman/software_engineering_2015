def circle x,y,r
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
  stroke="black" stroke-width="3" fill="red" />'
end

def rect (x,y,w,h) 
	'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="60" height="60"
  style="fill:rbg(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>'
end

def text (h,w,string)
	'<text x="'+ h.to_s + '" y="'+ w.to_s + '" fill="black"> '+ string.to_s + '</text>'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rect 100, 100, 30, 30)
	f.write(circle 80,80,30)
	f.write(circle 150,70,30)
	f.write(circle 70,150,30)
	f.write(circle 190,130,30)
	f.write(circle 140,190,30)

	f.write(text 150, 400, 'A_29_Yassen_Alexiev')

	f.write('</svg>')
end