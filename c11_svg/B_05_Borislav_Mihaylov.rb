def gime_a_circle1 x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" 
stroke="blue" stroke-width="4" fill="red" />'
end
def gime_a_circle2 x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" 
stroke="blue" stroke-width="4" fill="yellow" />'
end
def gime_a_circle3 x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" 
stroke="blue" stroke-width="4" fill="green" />'

end

def rectange x,y,w,h
  '<rect width="'+w.to_s+'" height="'+h.to_s+'" 
style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,255)"/>'
end


File.open("result.svg","w") do |f|
	f.write(rectange 00,00,100,250)
	f.write(gime_a_circle1 50,40,40)
	f.write(gime_a_circle2 50,120,40)
	f.write(gime_a_circle3 50,200,40)
	f.write('<text x"30" y="320" font-weight="bold" fill="black">Borislav Mihaylov.text>')	
	f.write('</svg>')
end
