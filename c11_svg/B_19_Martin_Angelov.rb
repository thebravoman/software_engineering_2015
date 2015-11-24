def gime_red_circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="white" stroke-width="2" fill="red" />'
end
def gime_yellow_circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="white" stroke-width="2" fill="yellow" />'
end
def gime_green_circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="white" stroke-width="2" fill="green" />'
end

def rectange x,y,w,h
  '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(212,144,200)"/>'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rectange 0,0,150,300)
	f.write(gime_red_circle 75,50,40)
	f.write(gime_yellow_circle 75,150,40)
	f.write(gime_green_circle 75,250,40)
	f.write('<text x="30" y="310" font-weight="bold" fill="black">Martin angelov</text>')
	f.write('</svg>')
end
