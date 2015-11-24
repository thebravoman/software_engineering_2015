def gime_a_circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="' +r.to_s+'"
	fill="red"/>'
	
end
def gime_b_circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="' +r.to_s+'"
	fill="yellow"/>'
	
end
def gime_c_circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="' +r.to_s+'"
	fill="green"/>'
	
end
def rectangle x,y
	'<rect width="'+x.to_s+'" height="'+y.to_s+'"
	style="fill:black;stroke-width:3;stroke:rgb(0,0,0)"/>'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rectangle 100, 200)
	f.write(gime_a_circle 50,30,30)
	f.write(gime_b_circle 50,100,30)
	f.write(gime_c_circle 50,170,30)
	 f.write('<text x="0" y="300" font-family="sans-serif" font-size="20px" fill="black"> Konstantin Todorov</text>')

	f.write('</svg>')
end
