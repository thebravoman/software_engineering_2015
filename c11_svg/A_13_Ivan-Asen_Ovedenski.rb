def circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="green" stroke-width="4" fill="red" />' 
	#'<ellipse cx="'+x.to_s+'" cy="'+y.to_s+'" rx="'+r.to_s+'" ry="50" style="fill:red;stroke:green;stroke-width:2" /></ellipse>'	
	
end


File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write('<circle cx="70" cy="70" r="30" stroke="green" stroke-width="4" fill="yellow" />')
	f.write(circle 30,30,20)
	f.write(circle 15,72,20 )
	f.write(circle 30,114,20)
	f.write(circle 75,127,20)
	f.write(circle 120,104,20)
	f.write(circle 125,52,20)
	f.write(circle 82,15,20)

	f.write('<text x="10" y="180" fill="blue">Ivan-Asen Ovedenski</text>')
	f.write('</svg>')
end
