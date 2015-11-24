def rect
	'<rect width="85" height="250" style="fill:rgb(0,0,0); stroke-width:3;stroke:rgb(0,0,0)" />' 
end

def circle color, x ,y
  '<circle cx="'+x+'" cy="'+y+'" r="40" stroke="black" stroke-width="3" fill="'+color+'" />'
end

File.open("result.svg", 'w') do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(rect)
	f.write(circle "red" , "40" , "40")
	f.write(circle "yellow", "40","120")
	f.write(circle "green", "40", "200")
	f.write('<text x="0" y="300" font-family="sans-serif" font-size="20px" fill="black">Lubomir Kiprov!</text>')
	f.write('</svg>')

end
