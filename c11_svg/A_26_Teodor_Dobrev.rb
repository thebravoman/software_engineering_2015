def circle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="red" />'
end

def hcircle x,y,r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="green" />'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(hcircle 500,260,100)
	f.write(circle 600,260,30)
	f.write(circle 400,260,30)
	f.write(circle 500,360,30)
	f.write(circle 500,160,30)
	
	f.write('<text x="0" y="15" fill="black">"Teodor DOBREV"</text>')
	f.write('</svg>')
end