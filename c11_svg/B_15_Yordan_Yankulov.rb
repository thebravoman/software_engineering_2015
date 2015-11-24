def gime_a_circle x,y,r,smth
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="1" fill="'+smth+'" />'
end

def rectange x,y,w,h
  '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:gray;stroke-width:1;stroke:rgb(0,0,0)"/>'
end
def name
  '<text x="0" y="200" fill="black">Yordan Yankulov</text>'
end
File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(rectange 30,150,60,180)
	f.write(gime_a_circle 30,30,30,'red')
	f.write(gime_a_circle 30,90,30,'yellow')
  f.write(gime_a_circle 30,150,30,'green')
  f.write(name)

	f.write('</svg>')
end
