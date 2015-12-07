def circle x,y,r
'<circle cx= "'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke= "pink" stroke-width="3" fill="pink"/>'
end
File.open("result.svg","w") do |f|
	f.write('<svg xmlns= "http://www.w3.org/2000/svg">')
	f.write(' <rect x="100" y="100" width="30" height="30" style="fill:purple;stroke-width:3;stroke:rgb(0,0,255);stroke-wwidth:3;stroke:rgb(0,0,0)"></rect>')
	f.write('<circle cx="131" cy="150" r="20" stroke="blue" stroke-width="3" fill="blue" />')
	f.write('<circle cx="150" cy="120" r="20" stroke="yellow" stroke-width="3" fill="yellow" />')
	f.write('<circle cx="90" cy="139" r="20" stroke="green" stroke-width="3" fill="green" />')
		 f.write('<circle cx="131" cy="90" r="20" stroke="brown" stroke-width="3" fill="brown" />')
	f.write(circle 88,90,20)
	f.write('<text x="200" y="200" fill="purple">Andrea Georgieva</text>')
	f.write('</svg>')
end
