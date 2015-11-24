def gime_a_circle_green x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="' +r.to_s+'"
	stroke="green" stroke-width="4" fill="green"/>'
end
def gime_a_circle_red x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="' +r.to_s+'"
	stroke="red" stroke-width="4" fill="red" />'
end
def gime_a_circle_yellow x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="' +r.to_s+'"
	stroke="yellow" stroke-width="4" fill="yellow" />'
end

def rectangle x,y,w,h
	'<rect width="'+w.to_s+'" height="'+h.to_s+'"
	style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end

def name x,y
  '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="red">Petar Georgiev</text>'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rectangle 0,0,60,140)
	f.write(gime_a_circle_red 30,20,20)
	f.write(gime_a_circle_yellow 30,70,20)
	f.write(gime_a_circle_green 30,120,20)
	f.write(name 0,160)
	f.write('</svg>')
end
