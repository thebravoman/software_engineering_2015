def circle x,y,r 
'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="white" />'
end
def rect x,y,width,height
'<rect width="'+width.to_s+'" y ="'+y.to_s+'" x ="'+x.to_s+'" height="'+height.to_s+'" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>'
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rect(100,100,40,40))
	#left
	f.write(circle(67,105,30))
	#upishleft
	f.write(circle(120,70,30))
	#farright
	f.write(circle(173,100,30))
	#rightdown
	f.write(circle(167,160,30))
	#downcenter
	f.write(circle(125,175,30))
	#downleft
	f.write(circle(78,165,30))
	f.write('</svg>')
	end